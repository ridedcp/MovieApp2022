//
//  HomeAssembly.swift
//  MovieApp2022
//
//  Created by Daniel Cano Platero on 21/6/22.
//

import UIKit.UINavigationController
import Domain

public class HomeAssembly {
    
    private let navigationController: UINavigationController
    private let getShowsUseCase: QueryCallableUseCase<[Show], GetShowsUseCaseParams>
    
    public init(navigationController: UINavigationController,
                getShowsUseCase: QueryCallableUseCase<[Show], GetShowsUseCaseParams>) {
        self.navigationController = navigationController
        self.getShowsUseCase = getShowsUseCase
    }
    
    public func build() -> UIViewController {
        return HomeViewController(viewModel: makeViewModel())
    }
    
    public func makeViewModel() -> HomeViewModel {
        return HomeViewModel(navigationController: navigationController,
                             getShowsUseCase: getShowsUseCase)
    }
}
