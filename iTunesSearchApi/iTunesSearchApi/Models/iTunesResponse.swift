//
//  iBookResponse.swift
//  iTunesSearchApi
//
//  Created by Vinicius Rodrigues on 10/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import Foundation
struct iTunesResponse:Equatable, Codable {
    var resultCount: Int
    var results: [Book]
    
    enum CondingKeys: String, CodingKey{
        case resultCount = "resultCount"
        case results = "results"
    }
}
