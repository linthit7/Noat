//
//  OnboardingViewController.swift
//  Noat
//
//  Created by MyanCare on 25/10/2023.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var onboardingPageCollectionView: UICollectionView!
    @IBOutlet weak var bottomSheetView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var onboardingPageControl: UIPageControl!
    @IBOutlet weak var skipButton: UIButton!
    
    var coordinator: OnboardingCoordinator?
    
    var viewModel: OnboardingViewModel!
    var currentPage: Int = 0 {
        didSet {
            onboardingPageControl.currentPage = currentPage
            if currentPage == viewModel.numberOfPages - 1 {
                nextButton.setTitle("Get Started", for: .normal)
                skipButton.isHidden = true
            } else {
                nextButton.setTitle("Next", for: .normal)
                skipButton.isHidden = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Onboarding"
        onboardingPageCollectionView.register(UINib(nibName: OnboardingPageCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: OnboardingPageCollectionViewCell.reuseIdentifier)
        onboardingPageCollectionView.dataSource = self
        onboardingPageCollectionView.delegate = self
        configureUI()
    }
    
    private func configureUI() {
        bottomSheetView.clipsToBounds = true
        bottomSheetView.layer.cornerRadius = 32
        nextButton.clipsToBounds = true
        nextButton.layer.cornerRadius = 16
    }

    @IBAction func nextButtonTouched(_ sender: UIButton) {
        viewModel.goToNextPage(currentPage, onboardingPageCollectionView) { isLastPage, nextPage in
            if isLastPage {
                self.coordinator?.endOnboardingScreen()
            } else {
                self.currentPage = nextPage!
            }
        }
        
    }
    
    @IBAction func skipButtonTouched(_ sender: UIButton) {
        viewModel.skipToLastPage(onboardingPageCollectionView) { lastPage in
            self.currentPage = lastPage
        }
    }
    
}

extension OnboardingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfPages
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingPageCollectionViewCell.reuseIdentifier, for: indexPath) as? OnboardingPageCollectionViewCell else { return UICollectionViewCell() }
        let page = viewModel.pages[indexPath.item]
        cell.configureUIWithData(page)
        return cell
    }
    
}

extension OnboardingViewController: UICollectionViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
