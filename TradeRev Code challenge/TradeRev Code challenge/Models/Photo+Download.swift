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
import ObjectMapper

fileprivate let imageCache = NSCache<NSString, UIImage>()


extension Photo {
    
    func downloadFullSizeImage(completion: @escaping imageDownloadCompleted ) {
        
        if let url = urls?.thumb, let image = imageCache.object(forKey: url as NSString) {
            
            completion(image)
        }
        
        
        guard let url = urls?.full else {
            
            return
        }
        downloadImage(url: url, completion: completion)
    }
    
    func downloadThumbnail(completion: @escaping imageDownloadCompleted) {
        
        guard let url = urls?.thumb else {
            
            return
        }
        downloadImage(url: url, completion: completion)
    }
    
    private func downloadImage(url: String, completion: @escaping imageDownloadCompleted) {
        
        if let cachedImage = imageCache.object(forKey: url as NSString) {
            completion(cachedImage)
            return
        }
        
        DispatchQueue.global(qos: .background).async {
            
            Alamofire.request(url).responseImage { (response) in
                
                guard let image = response.result.value else {
                    
                    return
                }
                imageCache.setObject(image, forKey: url as NSString)
                DispatchQueue.main.async {
                    
                    completion(image)
                }
            }
        }
        
    }
}
