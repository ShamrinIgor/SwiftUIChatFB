//
//  ChatLogViewModel.swift
//  SwiftUIChatFB
//
//  Created by Игорь on 19.07.2020.
//

import SwiftUI

class CharLogViewModel: ObservableObject {
    @Published var user: User?
    
    init(parthnerId: String) {
        findUser(with: parthnerId) { (user) in
            self.user = user
        }
    }
    
    init(user: User) {
        self.user = user
    }
}
