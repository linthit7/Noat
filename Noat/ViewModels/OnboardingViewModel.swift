//
//  OnboardingViewModel.swift
//  Noat
//
//  Created by MyanCare on 25/10/2023.
//

import Foundation
import UIKit

class OnboardingViewModel {
    
    let pages: [OnboardingPage] =
    [
        OnboardingPage(image: UIImage(named: "onboardingImage1")!, title: "Manage your notes easily", description: "A complete easy way to manage and customize your notes."),
        OnboardingPage(image: UIImage(named: "onboardingImage2")!, title: "Organize your thoughts", description: "Most beautiful note taking application."),
        OnboardingPage(image: UIImage(named: "onboardingImage3")!, title: "Create cards and easy styling", description: "Making your content legible has never been easiser.")
    ]
    
    var numberOfPages: Int {
        return pages.count
    }
    
    func goToNextPage(_ currentPage: Int, _ collectionView: UICollectionView, completion: @escaping(Bool,Int?) -> Void) {
        let nextPage = currentPage + 1
        if nextPage < numberOfPages {
            let xOffset = CGFloat(nextPage) * collectionView.frame.width
            collectionView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: true)
            completion(false,nextPage)
        } else {
            // Handle the behavior after the last page
            completion(true,nil)
        }
    }
    
    func skipToLastPage(_ collectionView: UICollectionView, completion: @escaping(Int) -> Void) {
        let contentOffsetX = collectionView.contentSize.width - collectionView.bounds.width
        collectionView.setContentOffset(CGPoint(x: contentOffsetX, y: 0), animated: true)
        let lastPage = numberOfPages - 1
        completion(lastPage)
    }
}
