//
//  NotesViewModel.swift
//  Noat
//
//  Created by Lin Thit Khant on 10/31/23.
//

import Foundation
import UIKit

class NotesViewModel {
    
    let tabs: [MainTab] =
    [
        MainTab(name: "All Notes", image: UIImage(systemName: "list.clipboard")!),
        MainTab(name: "Favourites", image: UIImage(systemName: "star")!),
        MainTab(name: "Hidden", image: UIImage(systemName: "eye.slash")!),
        MainTab(name: "Trash", image: UIImage(systemName: "trash")!)
    ]
    
    var numberOfTabs: Int {
        return tabs.count
    }
}
