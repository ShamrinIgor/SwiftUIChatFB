//
//  ImageView.swift
//  SwiftUIChatFB
//
//  Created by Игорь on 18.07.2020.
//

import SwiftUI
import UIKit


struct ImageView: View {
    
    @State var image = Image("cameraPlaceholder")
    
    init(url: String) {
        loadImageUsingCache(withURLString: url)
    }
    
    var body: some View {
        image
    }
    
    func loadImageUsingCache(withURLString urlString: String) {
        
        //check cache for image first
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) as? UIImage {
            image = Image(uiImage: cachedImage)
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
                    image = Image(uiImage: downloadedImage)
                }
            }
            
        }
        task.resume()
        
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: "https://firebasestorage.googleapis.com/v0/b/chatwithfirebase-afc91.appspot.com/o/2BE6F176-CDE5-44A0-943A-149C852AFFD0.png?alt=media&token=9f2418ac-7737-4458-b10a-f28ce0a83a02")
    }
}
