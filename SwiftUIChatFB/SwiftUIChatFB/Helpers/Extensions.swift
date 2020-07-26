//
//  Extensions.swift
//  ChatWithFireBase
//
//  Created by Игорь on 29.06.2020.
//  Copyright © 2020 Игорь. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI


let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func loadImageUsingCache(withURLString urlString: String) {
        
        //check cache for image first
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) as? UIImage {
            self.image = cachedImage
            return
        }
        
        
        let url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: url!) {
            (data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                
                if let downloadedImage = UIImage(data: data!) {
                    imageCache.setObject(downloadedImage, forKey: NSString(string: urlString))
                    self.image = downloadedImage
                }
            }
            
        }
        task.resume()
        
    }
}


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
