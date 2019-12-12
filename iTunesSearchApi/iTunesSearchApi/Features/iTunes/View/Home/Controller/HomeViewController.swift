//
//  HomeViewController.swift
//  iTunesSearchApi
//
//  Created by Vinicius Rodrigues on 09/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: BaseViewController<HomeViewModel> {
   
    @IBOutlet weak var hearderView: UIView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var recentStackView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        tableViewRegister()
        loadSearchRecents()
        setupUI()
    }
    
    override func setupUI() {
        searchBar.barTintColor = .white
        searchBar.backgroundColor = .lightGray
        searchBar.layer.borderWidth = 0
    }
    
    func setDelegates()  {
        searchBar.delegate = self
        viewModel.viewModelDelegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableViewRegister(){
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: viewModel.reuseIdentifier)
    }
    
    func loadSearchRecents()  {
        viewModel.recoverySearchRecents(context: context, delegate: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = viewModel.headerText
        self.navigationController?.navigationBar.prefersLargeTitles = true
        searchBar.layer.cornerRadius = 10
    }
    
    func toggleStackViewRecents(_ isHidden: Bool){
        recentStackView.isHidden = isHidden
    }
    
}

extension HomeViewController: HomeViewModeDelegate{
    func saveRecent() {
        viewModel.saveRecent(with: context)
    }
    
    func refresh() {
        
    }
    
    func startRequest() {

    }
    
    func endRequest() {
        
    }
    
    
}

extension HomeViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchText = searchText
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        viewModel.searchBooks()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.viewModel.searchText = ""
    }
}

extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(indexPath.row, from: self)
    }
}

extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = viewModel.numberOfItems()
        toggleStackViewRecents(count == 0 ? true : false)
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: viewModel.reuseIdentifier)!
        guard let recent = viewModel.fetchedController.fetchedObjects?[indexPath.row] else { return cell }
        cell.textLabel?.text = recent.text
        return cell
    }
}

extension HomeViewController: NSFetchedResultsControllerDelegate{
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .delete:
            if let indexPath = indexPath{
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        default:
            tableView.reloadData()
        }
    }
}
