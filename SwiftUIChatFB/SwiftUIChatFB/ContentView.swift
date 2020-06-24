//
//  ContentView.swift
//  ChatWithFBSwiftUI
//
//  Created by Игорь on 24.06.2020.
//  Copyright © 2020 Игорь. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var login: String = ""
    @State var password: String = ""
    @State var email: String = ""
    @State var showEmailTextField = true
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var avatarImage = Image("cameraPlaceholder")
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 0, y: 1))
                
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                avatarImage
                    .frame(width: 200, height: 200, alignment: .center)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(radius: 15)
                    .overlay(Circle().stroke(Color.white, lineWidth: 3))
                    .onTapGesture {
                        self.showingImagePicker = true
                    }
                
                Picker(selection: $showEmailTextField, label: Text("")) {
                    Text("Login").tag(false)
                    Text("Register").tag(true)
                }.pickerStyle(SegmentedPickerStyle())
                .padding()
                
                VStack {
                    Divider()
                    TextField("Login", text: $login)
                        .padding(.leading)
                    Divider()
                    TextField("Password", text: $password)
                        .padding(.leading)
                    
                    if showEmailTextField {
                        Divider()
                        TextField("Email", text: $email)
                            .padding(.leading)
                    }
                    Divider()
                }
                .background(Color.white, alignment: .bottom)
                .cornerRadius(10)
                .padding()
                
                
                Button {
                    print("Button pressed")
                } label: {
                    Text("Register")
                }
                
                .frame(height: 50, alignment: .center)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(10)
                .padding()
                Spacer()
            }
            .padding(.top, 40.0)
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
            avatarImage = Image(uiImage: inputImage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


