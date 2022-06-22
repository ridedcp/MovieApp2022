//
//  HomeAssembly.swift
//  MovieApp2022
//
//  Created by Daniel Cano Platero on 21/6/22.
//

import UIKit.UINavigationController
import Domain

public class HomeAssembly {
    
    private let getShowsUseCase: QueryCallableUseCase<[Show], GetShowsUseCaseParams>
    
    public init(getShowsUseCase: QueryCallableUseCase<[Show], GetShowsUseCaseParams>) {
        self.getShowsUseCase = getShowsUseCase
    }
    
    public func build() -> UIViewController {
        return HomeViewController(viewModel: makeViewModel(), router: makeRouter())
    }
    
    public func makeViewModel() -> HomeViewModel {
        return HomeViewModel(getShowsUseCase: getShowsUseCase)
    }
    
    public func makeRouter() -> HomeRouter {
        return HomeRouter()
    }
}
