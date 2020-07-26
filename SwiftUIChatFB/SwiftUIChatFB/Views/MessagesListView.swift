//
//  UsersList.swift
//  SwiftUIChatFB
//
//  Created by Игорь on 25.06.2020.
//

import SwiftUI

struct MessagesListView: View {
    
    var auth: Auth
    
    @StateObject var messagesViewModel = MessagesViewModel()
    
    var body: some View {
        
        List(messagesViewModel.messages) { message in
            
            NavigationLink(destination: ChatLogView(viewModel: CharLogViewModel(parthnerId: message.chatParthnerId()!))) {
                MessageCellView(message: message)
            }
        }
        
        .transition(.move(edge: .bottom))
    }
    
    func logOut() {
        self.auth.LogOut()
    }
}

struct UsersList_Previews: PreviewProvider {
    static var previews: some View {
        MessagesListView(auth: Auth(), messagesViewModel: MessagesViewModel(messages: MessageWithAvatar.createTestMessages()))
    }
}
