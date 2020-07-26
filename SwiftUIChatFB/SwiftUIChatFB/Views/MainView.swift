//
//  MessageTableView.swift
//  SwiftUIChatFB
//
//  Created by Игорь on 18.07.2020.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var AuthObject: Auth
    
    var body: some View {
        TabView {
            NavigationView {
                MessagesListView(auth: AuthObject)
                    .navigationTitle("Messages")
            }
            .tabItem {
                Image(systemName: "bubble.right")
                Text("Chats")
            }
            NavigationView {
                UsersTableView()
                    .navigationTitle("Users")
            }
            .tabItem {
                Image(systemName: "person.3")
                Text("Users")
                    .navigationTitle("Users")
            }
            
            NavigationView {
                Button("Log out") {
                    AuthObject.LogOut()
                }
                .navigationTitle("Settings")
            }
            .tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
        }
        .transition(.move(edge: .bottom))
    }
}

struct MessageTableView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(AuthObject: Auth())
    }
}
