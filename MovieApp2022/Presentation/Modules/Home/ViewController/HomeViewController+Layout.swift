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
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupCollectionView() {
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "HomeCollectionViewCell")
    }
    
}
