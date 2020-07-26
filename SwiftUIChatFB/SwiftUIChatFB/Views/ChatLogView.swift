//
//  ChatLogView.swift
//  SwiftUIChatFB
//
//  Created by Игорь on 19.07.2020.
//

import SwiftUI

struct ChatLogView: View {
    
    @ObservedObject var viewModel: CharLogViewModel
    
    @State var inputText: String = ""

    var body: some View {
        
        VStack{
            Spacer()
            HStack {
                TextField("message", text: $inputText)
                    .padding()
                Button("Send") {
                    SendMessage(text: inputText, to: viewModel.user!)
                }
                .padding()
            }
        }
        .navigationTitle(viewModel.user!.name!)
        
    }
}

struct ChatLogView_Previews: PreviewProvider {
    static var previews: some View {
        ChatLogView(viewModel: CharLogViewModel(parthnerId: "XKy1ejkgEcURA3dDC3OEFlRkNAN2"))
    }
}
