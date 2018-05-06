//
//  Photo.swift
//  TradeRev Code challenge
//
//  Created by David Ma on 2018-05-05.
//  Copyright © 2018 David Ma. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

struct Photo: Mappable {
    
    typealias imageDownloadCompleted = (UIImage) -> Void
   
    var id: String?
    var description: String?
    var likes: Int = 0
    var width: Int?
    var height: Int?
    var urls: Urls?
    var user: User?
    
    init?(map: Map) {}

    mutating func mapping(map: Map) {
        
        id <- map["id"]
        description <- map["description"]
        likes <- map["likes"]
        width <- map["width"]
        height <- map["height"]
        urls <- map["urls"]
        user <- map["user"]
    }
    
    func downloadFullSizeImage(completion: @escaping imageDownloadCompleted ) {
        
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
        
        DispatchQueue.global(qos: .background).async {
            
            Alamofire.request(url).responseImage { (response) in
                
                guard let image = response.result.value else {
                    
                    return
                }
                DispatchQueue.main.async {
                    
                   completion(image)
                }
            }
        }
        
    }
}
