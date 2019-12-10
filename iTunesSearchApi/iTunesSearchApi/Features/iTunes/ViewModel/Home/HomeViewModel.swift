//
//  HomeViewModel.swift
//  iTunesSearchApi
//
//  Created by Vinicius Rodrigues on 09/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import UIKit
import CoreData

class HomeViewModel: HomeViewModelProtocol {
    var reuseIdentifier: String
    var fetchedController: NSFetchedResultsController<SearchRecent>!
    var requestCoreData: RequestCoreDataProtocol{
        return RequestCoreDataDefault()
    }
    
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
        reuseIdentifier = String(describing: UITableViewCell.self)
    }
    
    func saveRecent(with context: NSManagedObjectContext) {
        let recent = SearchRecent(context: context)
        recent.text = searchText
        requestCoreData.saveSearchRecents(context: context) { (result) in
            switch result{
            case true:
                debugPrint("requestCoreData true")                
            case false:
                debugPrint("requestCoreData false")
            }
        }
    }
    
    func recoverySearchRecents(context: NSManagedObjectContext, delegate: NSFetchedResultsControllerDelegate) {
        let fetchRequest: NSFetchRequest<SearchRecent> = SearchRecent.fetchRequest()
        requestCoreData.recoverySearchRecents(context: context, fetchRequest: fetchRequest, sortBy: "text", fetchDelegate: delegate) { (fetchedResultController) in
            self.fetchedController = fetchedResultController
            self.fetchedController?.delegate = delegate
        }
    }
    
    func searchBooks(saveRecent: Bool = true) {
        guard let searchText = self.searchText, !searchText.isEmpty else { return }
        viewModelDelegate?.startRequest()
        if saveRecent {
            viewModelDelegate?.saveRecent()
        }
        bookAPI.searchBook(forSearchText: searchText) { (response) in
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
     
    func didSelectRow(_ row: Int, from controller: UIViewController) {
        guard let recent = fetchedController.fetchedObjects?[row], let text = recent.text else { return }
        searchText = text
        searchBooks(saveRecent: false)
    }
    
    func numberOfItems() -> Int {
        guard fetchedController != nil else { return 0}
        return fetchedController?.fetchedObjects?.count ?? 0
    }
}
