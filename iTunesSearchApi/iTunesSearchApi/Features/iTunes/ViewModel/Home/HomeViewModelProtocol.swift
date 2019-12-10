//
//  HomeViewModelType.swift
//  iTunesSearchApi
//
//  Created by Vinicius Rodrigues on 09/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import UIKit
import CoreData

protocol HomeViewModelProtocol {
    var bookAPI: iTunesAPIProtocol { get }
    var requestCoreData: RequestCoreDataProtocol { get }
    var headerText: String { get }
    var searchText: String? {get set}
    var iBooks: iTunesResponse? {get set}
    var fetchedController: NSFetchedResultsController<SearchRecent>! {get set}
    var reuseIdentifier: String { get }
    
    func viewDidLoad()
    func saveRecent(with context: NSManagedObjectContext)
    func updateView()
    func recoverySearchRecents(context: NSManagedObjectContext, delegate: NSFetchedResultsControllerDelegate)
    func searchBooks(saveRecent: Bool)
    func didSelectRow(_ row: Int, from controller: UIViewController)
    func numberOfItems() -> Int
}
