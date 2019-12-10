//
//  LibraryDetailsViewModel.swift
//  iTunesSearchApi
//
//  Created by Vinicius Rodrigues on 09/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import Foundation
class LibraryDetailsViewModel: LibraryDetailsViewModelProtocol {
    var book: Book
    var headerText: String
    
    func viewDidLoad() {
    }
    
    init(withBook book: Book) {
        self.book = book
        headerText = book.trackCensoredName ?? "Book Details"
    }
}
