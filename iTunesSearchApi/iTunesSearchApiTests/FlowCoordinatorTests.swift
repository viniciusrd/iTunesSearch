//
//  FlowCoordinatorTests.swift
//  iTunesSearchApiTests
//
//  Created by Vinicius Rodrigues on 10/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import XCTest
import UIKit

@testable import iTunes_Search

class FlowCoordinatorTests: XCTestCase {
    
    let navController = UINavigationController()
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAppCoordinatorFlow() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let appWindow = UIWindow()
        let applicationCoordinator = AppCoordinator(window: appWindow)
        applicationCoordinator.start()
        
        let rootViewController = applicationCoordinator.rootViewController as UINavigationController
        XCTAssert(rootViewController.viewControllers.first is HomeViewController, "The first view controller should be a HomeViewController")
    }
    
    func testHomeCoordinatorShowListLibraryViewController(){
        let coordinator = HomeCoordinator(navigationController: navController)
        coordinator.showListLibrary(withBooks: [])
         
        XCTAssert(navController.viewControllers.last is ListLibraryViewController, "The view controller should be a ListLibraryViewController")
    }
    
    func testShowHomeCoordinatorshowLibraryDetailsViewController(){
        let coordinator = HomeCoordinator(navigationController: navController)
        let book: Book? = DataReader.loadJson(filename: "BookResponse")
        guard book != nil else {
            XCTAssert(false, "Could not load book object")
            return
        }
        coordinator.showLibraryDetailsViewController(withBook: book!)
        XCTAssert(navController.viewControllers.last is LibraryDetailsViewController, "The view controller should be a LibraryDetailsViewControllers")
    }

}
