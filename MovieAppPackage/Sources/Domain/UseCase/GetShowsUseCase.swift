//
//  File.swift
//  
//
//  Created by Daniel Cano Platero on 21/6/22.
//

import Foundation

public class GetShowsUseCaseParams: UseCaseParams {
    
    public let page: Int

    public init(page: Int) {
        self.page = page
    }
}

public class GetShowsUseCase: QueryCallableUseCase<[Show], GetShowsUseCaseParams> {
    
    private let repository: SeriesRepository
    
    public init(repository: SeriesRepository) {
        self.repository = repository
    }
    
    public override func execute(params: GetShowsUseCaseParams? = nil,
                                 completion: @escaping (Result<[Show], Error>) -> Void) {
        guard let params = params else {
            return
        }
        
        repository.getShows(page: params.page, completion: completion)
    }
}
