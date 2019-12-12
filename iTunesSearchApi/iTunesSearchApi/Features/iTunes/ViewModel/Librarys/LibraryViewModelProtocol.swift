//
//  LibraryViewModelProtocol.swift
//  iTunesSearchApi
//
//  Created by Vinicius Rodrigues on 09/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import Foundation
protocol LibraryViewModelProtocol {
    var results: [Book] { get }
    var headerText: String { get }
    var reuseIdentifier: String { get }
    
    func didSelectRow(_ row: Int)
    func numberOfItems() -> Int
}
