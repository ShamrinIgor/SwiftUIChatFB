//
//  LoginView.swift
//  SwiftUIChatFB
//
//  Created by Игорь on 25.06.2020.
//

import SwiftUI

struct LoginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var email: String = ""
    @State var isRegisterMode = true
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var avatarImage = Image("cameraPlaceholder")
    @State var keyboardIsOpen = false
    
    var isAuth: Auth
    
    var body: some View {
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [Color(UIColor(rgb: 0xe6f7ff)) ,Color(UIColor(rgb: 0xb3d9ff)), Color(UIColor(rgb: 0x99ccff))]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
            
            VStack {
                if !keyboardIsOpen && isRegisterMode {
                    AvatarImageView(avatarImage: avatarImage)
                        .onTapGesture {
                            self.showingImagePicker.toggle()
                        }
                        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                            ImagePicker(image: self.$inputImage)
                        }
                }
                
                Picker(selection: $isRegisterMode, label: Text("")) {
                    Text("Login").tag(false)
                    Text("Register").tag(true)
                }
                .pickerStyle(SegmentedPickerStyle())
                .foregroundColor(.red)
                .padding()
                
                InputView(login: $username, password: $password, email: $email, showEmailTextField: $isRegisterMode)
                    .padding()
                
                Button {
                    print("Button pressed")
                    withAnimation {
                        if isRegisterMode {
//                            isAuth.Register(email: email, username: username, password: password)
                            isAuth.Register(email: email, username: username, password: password, avatarImage: inputImage)
                        } else {
                            isAuth.LogIn(email: email, password: password)
                        }
                    }
                } label: {
                    if isRegisterMode {
                        Text("Register")
                            .frame(maxWidth: .infinity)
                    } else {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                    }
                }
                
                .foregroundColor(.black)
                .frame(height: 50, alignment: .center)
                .background(Color.white)
                .cornerRadius(10)
                .padding()
                Spacer()
            }
            .padding(.top, 40)
            
        }
        .animation(.easeInOut(duration: 0.4))
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { _ in
                self.keyboardIsOpen.toggle()
            }
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                self.keyboardIsOpen.toggle()
            }
        }
        .transition(.opacity)
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        avatarImage = Image(uiImage: inputImage)
    }
}


struct AvatarImageView: View {
    var avatarImage: Image
    var body: some View {
        avatarImage
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200, alignment: .center)
            .background(Color.white)
            .clipShape(Circle())
            .shadow(radius: 15)
            .overlay(Circle().stroke(Color.white, lineWidth: 3))
            .transition(.scale)
    }
}

struct InputView: View {
    @Binding var login: String
    @Binding var password: String
    @Binding var email: String
    @Binding var showEmailTextField: Bool
    
    var body: some View {
        VStack {
            
            if showEmailTextField {
                Divider()
                HStack{
                    Image(systemName: "person.crop.circle")
                        .padding(10)
                    TextField("Login", text: $login)
                }
                .frame(height:40)
            }
            Divider()
            HStack {
                Image(systemName: "envelope")
                    .padding(10)
                TextField("Email", text: $email)
            }
            .frame(height:40)
            Divider()
            HStack {
                Image(systemName: "lock.shield")
                    .padding(10)
                TextField("Password", text: $password)
            }
            .frame(height:40)
            Divider()
        }
        .background(Color.white, alignment: .bottom)
        .cornerRadius(10)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            LoginView(isAuth: Auth())
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                            .previewDisplayName("iPhone 11")
            LoginView(isAuth: Auth())
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                            .previewDisplayName("iPhone SE")
        }
        
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
