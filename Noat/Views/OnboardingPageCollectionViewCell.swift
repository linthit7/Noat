//
//  OnboardingPageCollectionViewCell.swift
//  Noat
//
//  Created by MyanCare on 25/10/2023.
//

import UIKit

class OnboardingPageCollectionViewCell: UICollectionViewCell {

    @IBOutlet private(set) weak var pageImageView: UIImageView!
    @IBOutlet private(set) weak var pageTitleLabel: UILabel!
    @IBOutlet private(set) weak var pageDescriptionLabel: UILabel!
    
    static let reuseIdentifier = String(describing: OnboardingPageCollectionViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()

        let labelText = ""
        let attributedString = NSMutableAttributedString(string: labelText)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: labelText.count))
        
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
