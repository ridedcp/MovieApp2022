//
//  RepositoryAssembly.swift
//  MovieApp2022
//
//  Created by Daniel Cano Platero on 21/6/22.
//

import Foundation
import Domain
import Data

final class RepositoryAssembly {
    static func makeRepository() -> SeriesRepository {
        let networking = Networking()
        let session = URLSession(configuration: .default)
        return SeriesRepositoryImpl(networking: networking, session: session)
    }
}
