//
//  UseCaseAssembly.swift
//  MovieApp2022
//
//  Created by Daniel Cano Platero on 21/6/22.
//

import Foundation
import Domain
import Data

public class UseCaseAssembly {}

extension UseCaseAssembly {
    
    public static func makeGetShowsUseCase() -> QueryCallableUseCase<[Show], GetShowsUseCaseParams> {
        GetShowsUseCase(repository: RepositoryAssembly.makeRepository())
    }
}
