//
//  AppCoordinator.swift
//  MVVMRxSwift
//
//  Created by Saulo Garcia on 9/20/20.
//

import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let viewController = ViewController.instantiate(viewModel: RestaurantsListViewModel()) // connect from storyboard
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
