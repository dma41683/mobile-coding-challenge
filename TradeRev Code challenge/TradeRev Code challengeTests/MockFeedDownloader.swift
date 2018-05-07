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
    
     override func download(completion: ((Int) -> Void)?) {}
        
       
}

