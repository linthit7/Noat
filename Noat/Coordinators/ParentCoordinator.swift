//
//  ParentCoordinator.swift
//  Noat
//
//  Created by MyanCare on 26/10/2023.
//

import Foundation
import UIKit

class ParentCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if !UserDefaults.standard.bool(forKey: "hasLaunchedBefore") {
            UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
            UserDefaults.standard.synchronize()
            let onboardingCoordinator = OnboardingCoordinator(navigationController: navigationController)
            childCoordinators.append(onboardingCoordinator)
            onboardingCoordinator.start()
        } else {
            let mainCoordinator = MainCoordinator(navigationController: navigationController)
            childCoordinators.append(mainCoordinator)
            mainCoordinator.startWithoutOnboarding()
        }
        
    }

}
