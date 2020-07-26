import Foundation
import UIKit
import SwiftUI


let messagesTest = MessageProvider().messages().flatMap { $0 }

struct MessageTest: Identifiable {
    
    var id: Int
    let username: String
    let avatar: Image
    let text: String
    let date: String
    
//    init(id: ObjectIdentifier, username: String, avatar: Image, text: String, date: String) {
//        self.id = id
//        self.username = username
//        self.avatar = avatar
//        self.text = text
//        self.date = date
//    }
    
}

class MessageProvider {
    struct Const {
        static let texts = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis venenatis neque nec pellentesque mattis. In laoreet sollicitudin erat, id aliquet urna accumsan sed. Donec blandit commodo purus, vel viverra elit blandit varius. Quisque at dolor nec sem eleifend consequat. Aliquam odio diam, euismod ut ullamcorper nec, lacinia at mi. Sed sit amet iaculis arcu.",
                            "Phasellus consequat congue dolor vitae volutpat. Nunc vel est nisl. Vivamus sodales eros et mi elementum porta. Curabitur id ex mauris. Cras semper sapien vitae ipsum tristique consequat. Aenean maximus lorem vel porta ornare. Maecenas hendrerit sem dictum iaculis posuere.",
                            "Duis pulvinar tristique est, id dignissim augue cursus at. Nam quis aliquam leo.",
                            "Fusce ultricies ornare convallis. Aliquam tempor tortor sem, eu tincidunt turpis ultricies at. Nulla facilisi. Nunc ultricies diam nec eros finibus, vitae tempus odio ornare. Pellentesque lobortis risus nec luctus fermentum.",
                            "Nullam faucibus urna nec viverra bibendum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam mollis lectus est, id iaculis magna fringilla ut. Cras faucibus nulla sagittis diam pharetra cursus. Sed tortor enim, sollicitudin at libero quis, tincidunt sollicitudin justo.",
                            "Praesent consequat, libero consectetur pharetra dignissim, nibh enim efficitur tortor, sit amet consectetur ex urna vel purus. Praesent rutrum nunc tempor libero dictum, ac fermentum ligula auctor.",]
        
        static let avatars: [Image] = [Image(uiImage: #imageLiteral(resourceName: "avatar1.jpeg")),
                                       Image(uiImage: #imageLiteral(resourceName: "avatar2.jpeg")),
                                       Image(uiImage: #imageLiteral(resourceName: "avatar3.jpeg")),
                                       Image(uiImage: #imageLiteral(resourceName: "avatar4.jpeg")),
        ]
        static let dates1 = ["20:35", "16:02", "12:23", "09:00"]
        static let dates2 = ["Вчера", "Вчера", "Чт", "Вт", "Пн", "Пн"]
        static let dates3 = ["31.01.18", "25.01.18", "14.01.18", "01.01.18", "01.01.18", "31.12.17"]
    }
    
    func messages() -> [[MessageTest]] {
        var messages: [[MessageTest]] = []
        
        var section: [MessageTest] = []
//        for date in Const.dates1 {
//            let randoIndex = Int(arc4random_uniform(4))
//            let randomMessage = Int(arc4random_uniform(6))
//            section.append(Message(id: randoIndex, username: "FirstName LastName" + String(describing: randoIndex),
//                                   avatar: Const.avatars[randoIndex],
//                                   text: Const.texts[randomMessage],
//                                   date: date))
//
//        }
//        messages.append(section)
//
//        section = []
//        for date in Const.dates2 {
//            let randomIndex = Int(arc4random_uniform(4))
//            let randomMessage = Int(arc4random_uniform(6))
//            section.append(Message(id: randomIndex, username: "FirstName LastName" + String(describing: randomIndex),
//                                   avatar: Const.avatars[randomIndex],
//                                   text: Const.texts[randomMessage],
//                                   date: date))
//
//        }
//        messages.append(section)
        
        section = []
        for i in (1...50) {
            let randomIndex = Int(arc4random_uniform(4))
            let randomMessage = Int(arc4random_uniform(6))
            let lastMessageDate = i < Const.dates3.count ? Const.dates3[randomIndex] : Const.dates3.last ?? ""
            section.append(MessageTest(id: i, username: "FirstName LastName" + String(describing: randomIndex),
                                   avatar: Const.avatars[randomIndex],
                                   text: Const.texts[randomMessage],
                                   date: lastMessageDate))
        }
        messages.append(section)
        
        return messages
    }
}

struct DataProvider_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
