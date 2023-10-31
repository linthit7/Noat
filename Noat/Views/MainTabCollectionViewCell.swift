//
//  MainTabCollectionViewCell.swift
//  Noat
//
//  Created by Lin Thit Khant on 10/31/23.
//

import UIKit

class MainTabCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tabImageView: UIImageView!
    @IBOutlet weak var tabNameLabel: UILabel!
    
    static let reuseIdentifier = String(describing: MainTabCollectionViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        clipsToBounds = true
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        backgroundColor = UIColor.white
    }
    
    func configureUIWithData(_ tab: MainTab) {
        DispatchQueue.main.async {
            self.tabImageView.image = tab.image
            self.tabNameLabel.text = tab.name
        }
    }

}
