//
//  MessageCell.swift
//  SwiftUIChatFB
//
//  Created by Игорь on 18.07.2020.
//

import SwiftUI
import UIKit


class MessageWithAvatar: Message, Identifiable {
    var avatar: UIImage?
    var authorName: String?
    
    static func createTestMessages() -> [MessageWithAvatar] {
        let message1 = MessageWithAvatar()
        message1.authorName = "Ivan"
        message1.avatar = UIImage(named: "avatar4.jpeg")
        message1.fromID = "123"
        message1.toId = "321"
        message1.text = "Hello man!"
        message1.timestamp = 147777
        
        let message2 = MessageWithAvatar()
        message2.authorName = "Egor"
        message2.avatar = UIImage(named: "avatar2.jpeg")
        message2.fromID = "123"
        message2.toId = "321"
        message2.text = "Hello chel!"
        message2.timestamp = 4122212
        
        let message3 = MessageWithAvatar()
        message3.authorName = "Alex"
        message3.avatar = UIImage(named: "avatar3.jpeg")
        message3.fromID = "123"
        message3.toId = "321"
        message3.text = "Hello cringe!"
        message3.timestamp = 13413241
        
        return [message1, message2, message3]
    }
}

