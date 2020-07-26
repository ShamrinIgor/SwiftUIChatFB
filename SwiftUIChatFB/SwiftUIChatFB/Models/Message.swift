//
//  Message.swift
//  SwiftUIChatFB
//
//  Created by Игорь on 18.07.2020.
//
import UIKit
import Firebase

class Message {
    
    var fromID: String?
    var text: String?
    var toId: String?
    var timestamp: Int?
    
    convenience init(from dictionary: [String: Any]) {
        self.init()
        self.fromID = dictionary["fromId"] as? String
        self.text = dictionary["text"] as? String
        self.toId = dictionary["toId"] as? String
        self.timestamp = dictionary["timestamp"] as? Int
        
    }
    
    func chatParthnerId() -> String? {
        return fromID == Firebase.Auth.auth().currentUser?.uid ? toId : fromID
    }
    
}

