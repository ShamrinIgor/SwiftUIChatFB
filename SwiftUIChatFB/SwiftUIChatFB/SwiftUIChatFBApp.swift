//
//  SwiftUIChatFBApp.swift
//  SwiftUIChatFB
//
//  Created by Игорь on 24.06.2020.
//

import SwiftUI
import Firebase

@main
struct SwiftUIChatFBApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
