//
//  HomeViewController.swift
//  iTunesSearchApi
//
//  Created by Vinicius Rodrigues on 09/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController<HomeViewModel> {
   
    @IBOutlet weak var hearderView: UIView!
    @IBOutlet weak var contentView: UIView!
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = viewModel.headerText
        self.navigationController?.navigationBar.prefersLargeTitles = true
        searchBar.layer.cornerRadius = 10
    }
    
}

extension HomeViewController: HomeViewModeDelegate{
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
        guard let searchText = viewModel.searchText, !searchText.isEmpty else { return }
        viewModel.searchBooks(forText: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.viewModel.searchText = ""
    }
}
