//
//  CreateNoteCoordinator.swift
//  Noat
//
//  Created by Lin Thit Khant on 10/18/23.
//

import Foundation
import UIKit

class CreateNoteCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let createNoteVC = CreateNoteViewController()
        createNoteVC.tabBarItem = UITabBarItem(title: "Create Note", image: UIImage(named: "createNoteTabBarIcon"), tag: 2)
        createNoteVC.coordinator = self
        navigationController.pushViewController(createNoteVC, animated: false)
    }
    
    
    
}
