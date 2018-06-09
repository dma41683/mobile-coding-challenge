//
//  ModelDecoder.swift
//  TDBankAssignment
//
//  Created by David Ma on 2018-04-16.
//  Copyright © 2018 David Ma. All rights reserved.
//

import Foundation

struct ModelDecoder {
    
    private static let decoder = JSONDecoder()
    
    static func decodeSearchResults(forString json:String) -> [Photo]? {
        
        guard let data =  json.data(using: .utf8) else {
            
            return nil
        }
        
        return try? decoder.decode(Array<Photo>.self, from: data)
    }
}
