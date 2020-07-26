//
//  DowloadImageRequest.swift
//  ChatWithFireBase
//
//  Created by Игорь on 16.07.2020.
//  Copyright © 2020 Игорь. All rights reserved.
//

import Foundation
import UIKit

public enum BackendError: Error {
    case urlError(reason: String)
    case objectSerialization(reason: String)
}

public enum Result<T> {
    case success(T)
    case fail(Error)
    case badResponse(Int)
}


func DownLoadImageFromFB(with urlString: String, completionHandler: @escaping (Result<UIImage>) ->Void) {
    
    if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) as? UIImage {
        completionHandler(.success(cachedImage))
        return
    }
    
    
    let url = URL(string: urlString)
    let task = URLSession.shared.dataTask(with: url!) {
        (data, response, error) in
        
        if error != nil {
            print(error)
            return
        }
        
        
        if let downloadedImage = UIImage(data: data!) {
            imageCache.setObject(downloadedImage, forKey: NSString(string: urlString))
            completionHandler(.success(downloadedImage))
            
        }
        
    }
    task.resume()
    
}
