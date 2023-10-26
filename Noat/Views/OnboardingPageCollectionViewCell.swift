//
//  OnboardingPageCollectionViewCell.swift
//  Noat
//
//  Created by MyanCare on 25/10/2023.
//

import UIKit

class OnboardingPageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var pageImageView: UIImageView!
    @IBOutlet weak var pageTitleLabel: UILabel!
    @IBOutlet weak var pageDescriptionLabel: UILabel!
    
    static let reuseIdentifier = String(describing: OnboardingPageCollectionViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()

        let labelText = "Manage your notes easily"

        // Create a mutable attributed string
        let attributedString = NSMutableAttributedString(string: labelText)

        // Create paragraph style with the desired line spacing
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8  // Change the line spacing value as needed

        // Apply the paragraph style to the entire string
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: labelText.count))

        // Assign the attributed string to the UILabel
        pageTitleLabel.attributedText = attributedString
        pageTitleLabel.textAlignment = .center
        
        pageDescriptionLabel.attributedText = attributedString
        pageDescriptionLabel.textAlignment = .center
    }
    
    func configureUIWithData(_ page: OnboardingPage) {
        self.pageImageView.image = page.image
        self.pageTitleLabel.text = page.title
        self.pageDescriptionLabel.text = page.description
    }

}
