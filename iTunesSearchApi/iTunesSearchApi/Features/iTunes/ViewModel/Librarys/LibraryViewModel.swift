//
//  LibraryViewModel.swift
//  iTunesSearchApi
//
//  Created by Vinicius Rodrigues on 09/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import UIKit
class LibraryViewModel: LibraryViewModelProtocol{
    
    var results: [Book] = []
    var reuseIdentifier: String
    var headerText: String
    
    func viewDidLoad() {
        
    }
    
    weak var coordinatorDelegate: LibraryViewModelCoordinatorDelegate?
    weak var viewModelDelegate: LibraryViewModelDelegate?
    
    init() {
        headerText = "In Your Library"
        reuseIdentifier = String(describing: LibraryTableViewCell.self)
    }
    
    func didSelectRow(_ row: Int, from controller: UIViewController) {
        coordinatorDelegate?.didSelectedRowAt()
    }
    
    func numberOfItems() -> Int {
        return results.count
    }
}
