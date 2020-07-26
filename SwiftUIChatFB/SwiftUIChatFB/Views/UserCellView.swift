//
//  UserCell.swift
//  SwiftUIChatFB
//
//  Created by Игорь on 25.06.2020.
//

import SwiftUI
import struct Kingfisher.KFImage

struct UserCellView: View {
    
    var user: User
    
    var body: some View {
        HStack{
            
            KFImage(URL(string: user.profileImageURL!))
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.top, 8)
                .padding(.bottom, 8)
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(user.name ?? "username")
                    .font(.headline)
                    .padding(.bottom, 10)
                Text(user.email ?? "")
                    .lineLimit(3)
            }
            
            Spacer()
        }
        
    }
}

struct UserCellView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            let users = User.getTestUsers()
            UserCellView(user: users[0])
            UserCellView(user: users[1])
            UserCellView(user: users[2])
            
        }
            .previewLayout(.fixed(width: 400, height: 80))
    }
}
