//
//  Photo.swift
//  TradeRev Code challenge
//
//  Created by David Ma on 2018-05-05.
//  Copyright © 2018 David Ma. All rights reserved.
//

import Foundation

struct Photo: Codable {
       
    var id: String?
    var description: String?
    var likes: Int = 0
    var width: Int?
    var height: Int?
    var urls: Urls?
    var user: User?
}
