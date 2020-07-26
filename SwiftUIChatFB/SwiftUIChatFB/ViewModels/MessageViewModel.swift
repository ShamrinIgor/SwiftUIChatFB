//
//  MessagesViewModel.swift
//  SwiftUIChatFB
//
//  Created by Игорь on 19.07.2020.
//

import SwiftUI
import Firebase

protocol MessageContainerProtocol {
    var messages: [MessageWithAvatar] {get}
}


class MessagesViewModel: MessageContainerProtocol, ObservableObject {
    
    @Published var messages: [MessageWithAvatar] = []
    
    var messageDictionary = [String: MessageWithAvatar]()
    
    init() {
        observeUserMessages()
    }
    
    init(messages: [MessageWithAvatar]) {
        self.messages = messages
    }
    
    func observeUserMessages() {
        guard let uid = Firebase.Auth.auth().currentUser?.uid else {
            return
        }
        
        let ref = Firebase.Database.database().reference().child("user-messages").child(uid)
        ref.observe(.childAdded) { (snapshot) in
            let messageId = snapshot.key
            let messageReferce = Firebase.Database.database().reference().child("messages").child(messageId)
            
            messageReferce.observe(.value) { (snapshot) in
                
                if let dictonary = snapshot.value as? [String: Any] {
                    let message = MessageWithAvatar()
                    message.fromID = dictonary["fromId"] as? String
                    message.toId = dictonary["toId"] as? String
                    message.text = dictonary["text"] as? String
                    message.timestamp = dictonary["timestamp"] as? Int
                    
                    // ---
                    let chatParthnerId: String?
                    
                    if message.fromID == Firebase.Auth.auth().currentUser?.uid {
                        chatParthnerId = message.toId
                    } else {
                        chatParthnerId = message.fromID
                    }
                    
                    if let id = chatParthnerId {
                        let ref = Firebase.Database.database().reference().child("users").child(id)
                        ref.observe(.value) { (snapshot) in
                            if let dict = snapshot.value as? [String: Any] {
                                message.authorName = dict["name"] as? String

                                if let url = dict["profileImageURL"] as? String {
                                    DownLoadImageFromFB(with: url) { (result) in
                                        switch result {
                                        case .success(let image):
                                            message.avatar = image
                                        default:
                                            message.avatar = UIImage(named: "cameraPlaceholder")
                                        }
                                        self.appendMessageAndSort(message: message)
                                    }
                                } else {
                                    message.avatar = UIImage(named: "cameraPlaceholder")
                                    self.appendMessageAndSort(message: message)
                                }
                                
                            }
                        }
                    }
                }
            }
        }
        
    }
    
    private func appendMessageAndSort(message: MessageWithAvatar) {
        if let chatParthnerId = message.chatParthnerId() {
            self.messageDictionary[chatParthnerId] = message
            var messagesFromDict = Array(self.messageDictionary.values)
            messagesFromDict.sort { (message1, message2) -> Bool in
                guard let time1 = message1.timestamp, let time2 = message2.timestamp else {
                    return false
                }
                
                return time1 > time2
            }
            
            DispatchQueue.main.async {
                self.messages = messagesFromDict
            }
        }
    }
}


func SendMessage(text: String, to user: User) {
    
    let ref = Firebase.Database.database().reference().child("messages")
    let childRef = ref.childByAutoId()
    let toId = user.id
    let fromId = Firebase.Auth.auth().currentUser?.uid
    let timestamp = Int(Date().timeIntervalSince1970)
    let values: [String: Any] = ["text": text, "toId": toId, "fromId": fromId, "timestamp": timestamp]
    childRef.updateChildValues(values) { (error, ref) in
        if error != nil {
            print(error ?? "")
            return
        }
        
        guard let messageId = childRef.key else { return }
        
        let userMessagesRef = Database.database().reference().child("user-messages").child(fromId!).child(messageId)
        userMessagesRef.setValue(1)
        
        let recipientUserMessagesRef = Database.database().reference().child("user-messages").child(toId!).child(messageId)
        recipientUserMessagesRef.setValue(1)
    }
        
}
