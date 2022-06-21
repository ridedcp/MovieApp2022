//
//  HomeViewModel.swift
//  MovieApp2022
//
//  Created by Daniel Cano Platero on 21/6/22.
//

import Domain
import UIKit.UINavigationController

public class HomeViewModel {
    let navigationController: UINavigationController
    let getShowsUseCase: QueryCallableUseCase<[Show], GetShowsUseCaseParams>
    
    public init(navigationController: UINavigationController,
         getShowsUseCase: QueryCallableUseCase<[Show], GetShowsUseCaseParams>) {
        self.navigationController = navigationController
        self.getShowsUseCase = getShowsUseCase
    }
    
    func getShows() {
        let params = GetShowsUseCaseParams(page: 1)
        getShowsUseCase.execute(params: params) { result in
            switch result {
            case .success(let shows):
                print(shows)
            case .failure(let error):
                print(error)
            }
        }
    }
}
