//
//  MockFeedDownloader.swift
//  TradeRev Code challengeTests
//
//  Created by David Ma on 2018-05-06.
//  Copyright © 2018 David Ma. All rights reserved.
//

import Foundation

import ObjectMapper

class MockFeedDownloader: FeedDownloader {
    
    private var page = 0
    
    
    private func addPhotos() {
        
        for index in 0..<20 {
            
            let map: [String: Any] = [
                    "likes": Int(20 * page + index),
                    "description": "Photo \(page) - \(index)",
                    "user": [
                            "username": "username: \(page) - \(index)",
                            "name"     : "name: \(page) - \(index)"
                        ]
                ]
            photos.append(Photo(JSON: map)!)
        }
    }
    
     override func download(completion: ((Int) -> Void)?) {
        
        addPhotos()
        completion?(20)
        page = page + 1
    }
}

