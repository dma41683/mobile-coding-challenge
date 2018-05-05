//
//  User.swift
//  TradeRev Code challenge
//
//  Created by David Ma on 2018-05-05.
//  Copyright © 2018 David Ma. All rights reserved.
//

import Foundation
import ObjectMapper

struct User: Mappable {
    
    
    var id: String?
    var username: String?
    var name: String?
    var first_name: String?
    var last_name: String?
    var bio: String?
    var location: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        username <- map["username"]
        name <- map["name"]
        first_name <- map["first_name"]
        last_name <- map["last_name"]
        bio <- map["bio"]
        location <- map["location"]
    }
}
