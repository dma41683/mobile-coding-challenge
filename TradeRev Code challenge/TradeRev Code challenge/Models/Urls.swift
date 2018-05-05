//
//  Urls.swift
//  TradeRev Code challenge
//
//  Created by David Ma on 2018-05-05.
//  Copyright © 2018 David Ma. All rights reserved.
//

import Foundation
import ObjectMapper

struct Urls: Mappable {
    
    var raw: String?
    var full: String?
    var regular: String?
    var small: String?
    var thumb: String?
    
     init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        
        raw <- map["raw"]
        full <- map["full"]
        regular <- map["regular"]
        small <- map["small"]
        thumb <- map["thumb"]

    }
}
