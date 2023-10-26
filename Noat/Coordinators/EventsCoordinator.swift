//
//  EventsCoordinator.swift
//  Noat
//
//  Created by Lin Thit Khant on 10/18/23.
//

import Foundation
import UIKit

class EventsCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let eventsVC = EventsViewController()
        eventsVC.tabBarItem = UITabBarItem(title: "Events", image: UIImage(named: "eventsTabBarIcon"), tag: 1)
        eventsVC.coordinator = self
        navigationController.pushViewController(eventsVC, animated: false)
        
    }
    
    
    
}
