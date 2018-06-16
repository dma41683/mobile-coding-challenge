//
//  Photo+Download.swift
//  TradeRev Code challenge
//
//  Created by David Ma on 2018-05-06.
//  Copyright © 2018 David Ma. All rights reserved.
//

import Foundation
import AlamofireImage
import Alamofire

fileprivate let imageCache = NSCache<NSString, UIImage>()

typealias imageDownloadCompleted = (UIImage) -> Void


extension Photo {
    
    func downloadFullSizeImage(completion: @escaping imageDownloadCompleted ) -> DataRequest? {
        
        if let url = urls?.thumb, let image = imageCache.object(forKey: url as NSString) {
            
            completion(image)
            return nil
        }
        
        
        guard let url = urls?.full else {
            
            return nil
        }
        return downloadImage(url: url, completion: completion)
    }
    
    func downloadThumbnail(completion: @escaping imageDownloadCompleted) -> DataRequest? {
        
        guard let url = urls?.thumb else {
            
            return nil
        }
       return downloadImage(url: url, completion: completion)
    }
    
    private func downloadImage(url: String,
                               completion: @escaping imageDownloadCompleted) -> DataRequest? {
        
        if let cachedImage = imageCache.object(forKey: url as NSString) {
            completion(cachedImage)
           
            return nil
        }
        
       let request = Alamofire.SessionManager.default.request(url)
        
        DispatchQueue.global(qos: .background).async {
            
           request.responseImage { (response) in
                
                guard let image = response.result.value else {
                    
                    return
                }
                imageCache.setObject(image, forKey: url as NSString)
                DispatchQueue.main.async {
                    
                    completion(image)
                }
            }
        }
        return request
    }
}
