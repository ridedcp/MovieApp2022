//
//  HomeViewController.swift
//  MovieApp2022
//
//  Created by Daniel Cano Platero on 21/6/22.
//

import UIKit
import Domain

class HomeViewController: UIViewController {
    
    let viewModel: HomeViewModel
    let router: HomeRouter
    var data: [Show]?
    var collectionview: UICollectionView!
    
    public init(viewModel: HomeViewModel, router: HomeRouter) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Series List"
        bindingViewModel()
        viewModel.getShows()
        setupLayout()
        setupCollectionView()
        setupConstraints()
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        if let show = data?[indexPath.row] {
            cell.configCell(with: show)            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let navigation = self.navigationController else { return }
        router.navigateToDetailView(navigation: navigation, show: data![indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Style.Spacing.spacingL
    }
}

