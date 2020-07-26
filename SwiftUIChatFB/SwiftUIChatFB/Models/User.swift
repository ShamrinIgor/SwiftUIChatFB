//
//  User.swift
//  SwiftUIChatFB
//
//  Created by Игорь on 18.07.2020.
//

import Foundation
import SwiftUI

class User: NSObject, Identifiable, ObservableObject {
    @Published var id: String?
    @Published var email: String?
    @Published var name: String?
    @Published var profileImageURL: String?
    
    override init() {
        super.init()
    }
    
    init(id: String) {
        self.id = id
    }
    
    static func getTestUsers() -> [User] {
        let user1 = User()
        let user2 = User()
        let user3 = User()
        
        user1.email = "test1@mail.ru"
        user2.email = "test2@mail.ru"
        user3.email = "test3@mail.ru"
        
        user1.name = "User 1"
        user2.name = "User 2"
        user3.name = "User 3"
        
        user1.id = "1"
        user2.id = "2"
        user3.id = "3"
        
        user1.profileImageURL = "https://firebasestorage.googleapis.com/v0/b/chatwithfirebase-afc91.appspot.com/o/2BE6F176-CDE5-44A0-943A-149C852AFFD0.png?alt=media&token=9f2418ac-7737-4458-b10a-f28ce0a83a02"
        user2.profileImageURL = "https://firebasestorage.googleapis.com/v0/b/chatwithfirebase-afc91.appspot.com/o/45835F5D-0E57-432F-ADD7-33CF79959B72.png?alt=media&token=d37e1ddf-dfa0-4d5d-88c6-8aae881f1ab8"
        user3.profileImageURL = "https://firebasestorage.googleapis.com/v0/b/chatwithfirebase-afc91.appspot.com/o/5543E691-23D9-418A-B89A-86D13CB6611F.png?alt=media&token=a33d5d07-1e79-4bf5-9a26-38bc4e69f775"
        
        return [user1, user2, user3]
    }
}
