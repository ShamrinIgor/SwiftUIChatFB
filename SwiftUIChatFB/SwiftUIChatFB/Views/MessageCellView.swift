//
//  UserCell.swift
//  SwiftUIChatFB
//
//  Created by Игорь on 25.06.2020.
//

import SwiftUI

struct MessageCellView: View {
    
    var message: MessageWithAvatar
    
    var body: some View {
        HStack{
            Image(uiImage: message.avatar ?? UIImage(named: "cameraPlaceholder")!)
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.top, 8)
                .padding(.bottom, 8)
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(message.authorName ?? "username")
                    .font(.headline)
                    .padding(.bottom, 10)
                Text(message.text ?? "")
                    .lineLimit(3)
            }
            
            Spacer()
        }
        
    }
}

struct MessageCellView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            let messages = MessageWithAvatar.createTestMessages()
            MessageCellView(message: messages[0])
            MessageCellView(message: messages[1])
            MessageCellView(message: messages[2])
            
        }
            .previewLayout(.fixed(width: 400, height: 80))
    }
}
