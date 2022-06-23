//
//  HomeViewController+ViewModel.swift
//  MovieApp2022
//
//  Created by Daniel Cano Platero on 21/6/22.
//

import Foundation

extension HomeViewController {
    
    func bindingViewModel() {
        bindCollectionCompleted()
    }
    
    private func bindCollectionCompleted() {
        viewModel.$collectionObservable.bind() { [weak self] resource in
            guard let resource = resource else {
                return
            }
            switch resource {
            case .loading:
                print("Loading")
            case .success(let collection):
                self?.data = collection
                DispatchQueue.main.async {
                    self?.collectionview.reloadData()
                }
            case .failure:
                print("failure")
            }
        }
    }
}
