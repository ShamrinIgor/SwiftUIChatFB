//
//  ContentView.swift
//  ChatWithFBSwiftUI
//
//  Created by Игорь on 24.06.2020.
//  Copyright © 2020 Игорь. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var AuthObject = Auth()
    
    init() {
        AuthObject.checkIfUserIsLogIn()
    }
    
    var body: some View {
        
        ZStack {
            if !AuthObject.isAuth {
                LoginView(isAuth: AuthObject)
            } else {
                MainView(AuthObject: AuthObject)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


