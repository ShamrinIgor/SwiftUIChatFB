//
//  MainViewController.swift
//  SwiftUIChatFB
//
//  Created by Игорь on 25.06.2020.
//

import SwiftUI

struct MainViewController: View {
    
    var auth: Auth
    
    var body: some View {
        ZStack {
            Color.blue
            .edgesIgnoringSafeArea(.all)
            
            Button("LogOut") {
                withAnimation {
                    auth.LogOut()
                }
            }
            .foregroundColor(.red)
        }
        .transition(.move(edge: .bottom))
        
        
    }
}

struct MainViewController_Previews: PreviewProvider {
    static var previews: some View {
        MainViewController(auth: Auth())
    }
}
