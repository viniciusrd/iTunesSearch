//
//  HomeViewModel.swift
//  iTunesSearchApi
//
//  Created by Vinicius Rodrigues on 09/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import Foundation
class HomeViewModel: HomeViewModelProtocol {
    var headerText: String
    
    var searchText: String?
    
    func viewDidLoad() {
    }
    
    weak var coordinatorDelegate: HomeViewModelCoordinatorDelegate?
    weak var viewModelDelegate: HomeViewModeDelegate?
    
    init() {
        headerText = ""
    }
}
