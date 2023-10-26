//
//  SearchCoordinator.swift
//  Noat
//
//  Created by Lin Thit Khant on 10/18/23.
//

import Foundation
import UIKit

class SearchCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let searchVC = SearchViewController()
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "searchTabBarIcon"), tag: 2)
        searchVC.coordinator = self
        navigationController.pushViewController(searchVC, animated: false)
        
    }
    
    
    
}
