//
//  MainViewController.swift
//  Noat
//
//  Created by Lin Thit Khant on 10/18/23.
//

import UIKit

class MainViewController: UITabBarController {

    weak var coordinator: MainCoordinator?
    
    let notesCoordinator = NotesCoordinator(navigationController: UINavigationController())
    let eventsCoordinator = EventsCoordinator(navigationController: UINavigationController())
    let searchCoordinator = SearchCoordinator(navigationController: UINavigationController())
    let createNoteCoordinator = CreateNoteCoordinator(navigationController: UINavigationController())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        notesCoordinator.start()
        eventsCoordinator.start()
        searchCoordinator.start()
        createNoteCoordinator.start()
        viewControllers = [notesCoordinator.navigationController,eventsCoordinator.navigationController,searchCoordinator.navigationController,createNoteCoordinator.navigationController]
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
    }

}
