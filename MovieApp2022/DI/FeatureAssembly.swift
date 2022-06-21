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
    
    public static let homeFeature: FeatureProvider = { navigationController in
        let useCase = GetShowsUseCase(repository: RepositoryAssembly.makeRepository())
        return HomeAssembly(navigationController: navigationController, getShowsUseCase: useCase).build()
    }
    
}
