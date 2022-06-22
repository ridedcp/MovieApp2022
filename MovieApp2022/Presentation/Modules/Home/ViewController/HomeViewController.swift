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
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
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
//        setupCollectionView()
//        setupLayout()
//        setupConstraints()
        viewModel.getShows()
        bindingViewModel()
        
        
        let button = UIButton(frame: CGRect(x: 0, y: 400, width: 100, height: 200))
        button.setTitle("CACA", for: .normal)
        button.backgroundColor = .red
        view.addSubview(button)
        button.addTarget(self, action: #selector(navigate), for: .touchUpInside)
    }
    
    @objc func navigate() {
        guard let navigation = self.navigationController else { return }
        router.navigateToDetailView(navigation: navigation, show: data![0])
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell,
              let show = data?[indexPath.row] else {
                  return UICollectionViewCell()
              }
       
        cell.configCell(with: show)
        return cell
    }
}

