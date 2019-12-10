//
//  HomeViewModel.swift
//  iTunesSearchApi
//
//  Created by Vinicius Rodrigues on 09/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import Foundation
class HomeViewModel: HomeViewModelProtocol {
    
    var bookAPI: iTunesAPIProtocol{
        return iTunesAPIDefault()
    }
    var headerText: String
    var searchText: String?
    var iBooks: iTunesResponse?
    
    func viewDidLoad() {
        
    }
    
    func updateView() {
        guard let booksResults = iBooks else { return }
        if booksResults.results.count > 0 {
            coordinatorDelegate?.showListLibrary(withBooks: booksResults.results)
        }
    }
    

    weak var coordinatorDelegate: HomeViewModelCoordinatorDelegate?
    weak var viewModelDelegate: HomeViewModeDelegate?
    
    init() {
        headerText = "Search"
        iBooks = nil
    }
    
    func searchBooks(forText text: String) {
        viewModelDelegate?.startRequest()
        bookAPI.searchBook(forSearchText: text) { (response) in
            self.viewModelDelegate?.endRequest()
            switch response{
            case .success(let response):
                guard let response = response else { return }
                self.iBooks = response
                DispatchQueue.main.async {
                   self.updateView()
                }
            case .failure(let error):
                guard let error = error else { return }
                print(error)
            }
        }
    }
}
