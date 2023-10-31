//
//  NotesViewController.swift
//  Noat
//
//  Created by Lin Thit Khant on 10/18/23.
//

import UIKit

class NotesViewController: UIViewController {

    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    weak var coordinator: NotesCoordinator?
    
    var viewModel: NotesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Notes"
        mainCollectionView.register(UINib(nibName: MainTabCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: MainTabCollectionViewCell.reuseIdentifier)
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        configureUI()
        if let flowLayout = mainCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumInteritemSpacing = 5 // horizontal spacing
            flowLayout.minimumLineSpacing = 5 // vertical spacing
        }
    }
    
    private func configureUI() {
        mainCollectionView.backgroundColor = UIColor(hex: "ECEDF2")
    }

}

// MARK: UICollectionViewDataSource
extension NotesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return viewModel.numberOfTabs
        case 1: return 0
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainTabCollectionViewCell.reuseIdentifier, for: indexPath) as? MainTabCollectionViewCell else { return UICollectionViewCell() }
            let tab = viewModel.tabs[indexPath.item]
            cell.configureUIWithData(tab)
            return cell
        case 1: return UICollectionViewCell()
        default: return UICollectionViewCell()
        }
        
    }

}

// MARK: UICollectionViewDelegate
extension NotesViewController: UICollectionViewDelegate {
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension NotesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.3, height: 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
    }
    
    
}
