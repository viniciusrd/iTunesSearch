//
//  AppCoordinator.swift
//  iTunesSearchApi
//
//  Created by Vinicius Rodrigues on 09/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import UIKit
class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    let window: UIWindow
    let rootViewController: UINavigationController
    let homeCoordinator: HomeCoordinator
    
    init(window: UIWindow) {
        self.window = window
        self.rootViewController = UINavigationController()
        self.window.rootViewController = self.rootViewController
        self.homeCoordinator = HomeCoordinator(navigationController: rootViewController)
    }
    
    func start() {
        self.window.rootViewController = self.rootViewController
        self.window.makeKeyAndVisible()
        self.homeCoordinator.start()
    }
}
