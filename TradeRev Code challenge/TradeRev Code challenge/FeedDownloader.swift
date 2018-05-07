//
//  FeedDownloader.swift
//  TradeRev Code challenge
//
//  Created by David Ma on 2018-05-05.
//  Copyright © 2018 David Ma. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class FeedDownloader {
    
    var photos: [Photo] = []
    private var page    = 0
    
    func url(for page: Int) -> String {
        
        return "https://api.unsplash.com/photos/?client_id=08eb03db3b277c9ba6273dd6e0b844f9f17328b6bb5dc5e5bff0939bd233deb3&per_page=20&page=\(page)"
    }
    
    func download(completion: ((Int) -> Void)?) {
        
        page = page + 1
        DispatchQueue.global(qos: .background).async {
         
            Alamofire.request(self.url(for: self.page)).responseString { (response) in
                
                var size = 0
                if let results = response.result.value {
                    
                    if let  array = Mapper<Photo>().mapArray(JSONString: results) {
                        
                        size = array.count
                        self.photos.append(contentsOf: array)
                    }
                }
                DispatchQueue.main.async {
                    
                    completion?(size)
                }
            }
        }
    }
}
