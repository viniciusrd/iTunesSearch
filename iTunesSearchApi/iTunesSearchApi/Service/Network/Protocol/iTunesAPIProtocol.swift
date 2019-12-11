//
//  iTunesAPIProtocol.swift
//  iTunesSearchApi
//
//  Created by Vinicius Rodrigues on 10/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import Foundation
protocol iTunesAPIProtocol {
    func searchBook(forSearchText text: String, completion: @escaping APIRequest.ResponseBlock<iTunesResponse>)
}
