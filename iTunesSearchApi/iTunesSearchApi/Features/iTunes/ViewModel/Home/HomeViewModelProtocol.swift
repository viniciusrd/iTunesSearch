//
//  HomeViewModelType.swift
//  iTunesSearchApi
//
//  Created by Vinicius Rodrigues on 09/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import Foundation
protocol HomeViewModelProtocol {
    var bookAPI: iTunesAPIProtocol { get }
    var headerText: String { get }
    var searchText: String? {get set}
    var iBooks: iTunesResponse? {get set}
    func viewDidLoad()
    func updateView()
    func searchBooks(forText text: String)
}
