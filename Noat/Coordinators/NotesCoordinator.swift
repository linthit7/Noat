//
//  NotesCoordinator.swift
//  Noat
//
//  Created by Lin Thit Khant on 10/18/23.
//

import Foundation
import UIKit

class NotesCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let notesVC = NotesViewController()
        notesVC.tabBarItem = UITabBarItem(title: "Notes", image: UIImage(named: "notesTabBarIcon"), tag: 0)
        notesVC.coordinator = self
        navigationController.pushViewController(notesVC, animated: false)
    }
    
    
    
}
