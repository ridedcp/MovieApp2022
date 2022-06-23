//
//  HomeViewController+UI.swift
//  MovieApp2022
//
//  Created by Daniel Cano Platero on 21/6/22.
//

import Foundation
import UIKit

extension HomeViewController {
    
    func setupLayout() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: Style.Spacing.spacingM, left: Style.Spacing.spacingS, bottom: Style.Spacing.spacingM, right: Style.Spacing.spacingS)
        layout.itemSize = CGSize(width: 180, height: 220)
        collectionview = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
    }

    func setupCollectionView() {
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = .white
        self.view.addSubview(collectionview)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            collectionview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionview.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            collectionview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50)
        ])
    }
}
