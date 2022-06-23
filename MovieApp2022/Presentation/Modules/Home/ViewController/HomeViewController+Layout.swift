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
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: 50)
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
            collectionview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            collectionview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50),
            collectionview.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            collectionview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50)
        ])
    }
}
