//
//  UsersContainer.swift
//  SwiftUIChatFB
//
//  Created by Игорь on 19.07.2020.
//

import SwiftUI
import Firebase

protocol UserContainerProtocol {
    var users: [User] {get}
}

class UsersViewModel: UserContainerProtocol, ObservableObject {
    @Published var users: [User] = []
    
    init() {
        getUsersFromDataBase()
    }
    
    init(users: [User]) {
        self.users = users
    }
    
    func getUsersFromDataBase() {
        let ref = Firebase.Database.database().reference().child("users")
        
        ref.observe(.childAdded) { (snapshot) in
            if let dict = snapshot.value as? [String: Any] {
                let user = User()
                
                user.id = snapshot.key
                user.name = dict["name"] as? String
                user.email = dict["email"] as? String
                user.profileImageURL = dict["profileImageURL"] as? String
                
                self.users.append(user)
            }
        }
    }
}


func findUser(with id: String, complitionHandler: @escaping (User) -> Void) {
    let ref = Firebase.Database.database().reference().child("users").child(id)
    ref.observe(.value) { (snapshot) in
        if let dict = snapshot.value as? [String: Any] {
            
            let user = User()
            user.id = id
            user.name = dict["name"] as? String
            user.email = dict["email"] as? String
            user.profileImageURL = dict["profileImageURL"] as? String
            
            complitionHandler(user)
        }
    }
}
