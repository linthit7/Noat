//
//  CoordinatorProtocol.swift
//  Noat
//
//  Created by Lin Thit Khant on 10/18/23.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
