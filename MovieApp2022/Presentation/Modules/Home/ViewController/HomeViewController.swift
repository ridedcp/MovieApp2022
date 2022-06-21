//
//  HomeViewController.swift
//  MovieApp2022
//
//  Created by Daniel Cano Platero on 21/6/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    let viewModel: HomeViewModel
    
    
    let collectionView = UICollectionView()
    
    public init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        setupLayout()
        setupConstraints()
        setupCollectionView()
        viewModel.getShows()
        bindingViewModel()
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

