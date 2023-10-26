//
//  OnboardingCoordinator.swift
//  Noat
//
//  Created by Lin Thit Khant on 10/19/23.
//

import Foundation
import UIKit

class OnboardingCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let onboardingVC = OnboardingViewController()
        onboardingVC.viewModel = OnboardingViewModel()
        onboardingVC.coordinator = self
        navigationController.pushViewController(onboardingVC, animated: false)
    }
    
    func endOnboardingScreen() {
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        childCoordinators.append(mainCoordinator)
        mainCoordinator.start()
    }
    
}
