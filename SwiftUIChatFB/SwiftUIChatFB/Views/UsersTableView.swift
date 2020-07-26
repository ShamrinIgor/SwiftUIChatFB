//
//  UsersTableView.swift
//  SwiftUIChatFB
//
//  Created by Игорь on 19.07.2020.
//

import SwiftUI

struct UsersTableView: View {
    
    @StateObject var userViewModel = UsersViewModel()
    
    var body: some View {
        List(userViewModel.users) { user in
            NavigationLink(destination: ChatLogView(viewModel: CharLogViewModel(user: user))) {
                UserCellView(user: user)
            }
        }
    }
}

struct UsersTableView_Previews: PreviewProvider {
    static var previews: some View {
        UsersTableView(userViewModel: UsersViewModel(users: User.getTestUsers()))
    }
}
