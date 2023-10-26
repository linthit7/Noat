//
//  MainCoordinator.swift
//  Noat
//
//  Created by MyanCare on 26/10/2023.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainVC = MainViewController()
        mainVC.modalPresentationStyle = .fullScreen
        navigationController.present(mainVC, animated: true)
    }
    
    func startWithoutOnboarding() {
        let mainVC = MainViewController()
        mainVC.modalPresentationStyle = .fullScreen
        navigationController.present(mainVC, animated: false)
    }
}
