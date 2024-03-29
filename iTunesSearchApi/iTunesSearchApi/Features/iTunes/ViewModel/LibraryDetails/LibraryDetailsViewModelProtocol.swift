//
//  LibraryDetailsViewModelProtocol.swift
//  iTunesSearchApi
//
//  Created by Vinicius Rodrigues on 09/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import Foundation
protocol LibraryDetailsViewModelProtocol {
    var book: Book {get set}
    var headerText: String { get }
    func viewDidLoad()
    
}
