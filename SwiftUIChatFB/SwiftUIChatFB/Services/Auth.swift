//
//  Auth.swift
//  SwiftUIChatFB
//
//  Created by Игорь on 18.07.2020.
//

import SwiftUI
import Firebase

final class Auth: ObservableObject {
    @Published private(set) var isAuth = false
    
    func checkIfUserIsLogIn() {
        if Firebase.Auth.auth().currentUser?.uid == nil {
            isAuth = false
        } else {
            isAuth = true 
        }
    }
    
    func LogIn(email: String, password: String) {
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                print("Auth error: ", error)
                return
            }
            
            withAnimation() {
                self.isAuth = true
            }
        }
    }
    
    func LogOut() {
        
        do {
            try FirebaseAuth.Auth.auth().signOut()
            withAnimation() {
                self.isAuth = false
            }
        } catch let error {
            print("Sign out error", error)
        }
    }
    
    func Register(email: String, username: String, password: String, avatarImage: UIImage? = nil) {
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                print("Register error: ", error)
                return
            }
            
            withAnimation() {
                self.isAuth = true
            }
            
            let imageID = NSUUID().uuidString
            
            let uploadData = avatarImage?.pngData()
            
            let storageRef = Firebase.Storage.storage().reference().child("\(imageID).png")
            
            guard let data = uploadData else {
                let values = ["name": username, "email": email]
                self.RegisterIntoDatabase(uid: (user?.user.uid)!, values: values)
                return
            }
            
            storageRef.putData(data, metadata: nil) { (metadata, error) in
                if let error = error {
                    print(error)
                    return
                }
                
                storageRef.downloadURL { (url, error) in
                    if let error = error {
                        print(error)
                        return
                    }
                    
                    let imageUrl = url?.absoluteString
                    
                    let values = ["name": username, "email": email, "profileImageURL": imageUrl!]
                    self.RegisterIntoDatabase(uid: (user?.user.uid)!, values: values)
                }
            }
            
        }
    }
    
    func RegisterIntoDatabase(uid: String, values: [String: Any]) {
        let ref = Database.database().reference()
        let usersRef = ref.child("users").child(uid)
        
        usersRef.updateChildValues(values, withCompletionBlock: { (error, ref) in
            if error != nil {
                print(error)
                return
            }
            
            print("Saved user succesfuly to FireBase!")
        })
    }
}

//struct Auth: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct Auth_Previews: PreviewProvider {
//    static var previews: some View {
//        Auth()
//    }
//}
