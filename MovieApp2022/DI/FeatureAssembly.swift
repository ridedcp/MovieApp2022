//
//  FeatureAssembly.swift
//  MovieApp2022
//
//  Created by Daniel Cano Platero on 21/6/22.
//

import Foundation
import Data
import Domain

public class FeatureAssembly {
    
    public static let homeFeature: ViewControllerProvider = {
        let useCase = GetShowsUseCase(repository: RepositoryAssembly.makeRepository())
        return HomeAssembly(getShowsUseCase: useCase).build()
    }
    
    public static let detailFeature: SingleParamFeatureProvider<Show> = { navigationController, show in
        return DetailAssembly(navigationController: navigationController, show: show).build()
    }
}
