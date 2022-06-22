//
//  HomeViewModel.swift
//  MovieApp2022
//
//  Created by Daniel Cano Platero on 21/6/22.
//

import Domain
import UIKit.UINavigationController

public class HomeViewModel {
    let getShowsUseCase: QueryCallableUseCase<[Show], GetShowsUseCaseParams>
    
    @Observable var collectionObservable: Resource<[Show]>? = .none
    
    public init(getShowsUseCase: QueryCallableUseCase<[Show], GetShowsUseCaseParams>) {
        self.getShowsUseCase = getShowsUseCase
    }
    
    func getShows() {
        let params = GetShowsUseCaseParams(page: 1)
        getShowsUseCase.execute(params: params) { result in
            switch result {
            case .success(let shows):
                self.collectionObservable = .success(shows)
            case .failure(let error):
                self.collectionObservable = .failure(error.localizedDescription)
            }
        }
    }
}
