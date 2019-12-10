//
//  LibraryViewModelProtocol.swift
//  iTunesSearchApi
//
//  Created by Vinicius Rodrigues on 09/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import UIKit
protocol LibraryViewModelProtocol {
    var headerText: String { get }
    var reuseIdentifier: String { get }
    
    func viewDidLoad()
    func didSelectRow(_ row: Int, from controller: UIViewController)
    func numberOfItems() -> Int
}
