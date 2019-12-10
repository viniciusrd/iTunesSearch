//
//  HomeCoordinator.swift
//  iTunesSearchApi
//
//  Created by Vinicius Rodrigues on 09/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showHomeViewController()
    }
    
    func showHomeViewController(){
        let viewModel = HomeViewModel()
        let controller = HomeViewController(viewModel: viewModel)
        viewModel.coordinatorDelegate = self
        self.navigationController.pushViewController(controller, animated: true)
        
    }
    
    func showListLibraryViewController(withBooks books: [Book]) {
        let viewModel = LibraryViewModel()
        viewModel.results = books
        let controller = ListLibraryViewController(viewModel: viewModel)
        viewModel.coordinatorDelegate = self
        self.navigationController.pushViewController(controller, animated: true)
    }
    
    func showLibraryDetailsViewController(withBook book: Book) {
        let viewModel = LibraryDetailsViewModel(withBook: book)
        let controller = LibraryDetailsViewController(viewModel: viewModel)
        self.navigationController.pushViewController(controller, animated: true)
    }
}

extension HomeCoordinator: HomeViewModelCoordinatorDelegate{
    func showListLibrary(withBooks books: [Book]) {
        showListLibraryViewController(withBooks: books)
    }
}

extension HomeCoordinator: LibraryViewModelCoordinatorDelegate{
    func didSelectedRowAt(withBook book: Book) {        
        showLibraryDetailsViewController(withBook: book)
    }
}
