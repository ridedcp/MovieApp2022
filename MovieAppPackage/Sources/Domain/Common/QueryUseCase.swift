//
//  File.swift
//  
//
//  Created by Daniel Cano Platero on 21/6/22.
//

import Foundation

open class QueryCallableUseCase<T, P: UseCaseParams>: UseCase<P> {
    
    public override init() {}
    
    open func execute(params: P? = nil,
                      completion: @escaping (Result<T, Swift.Error>) -> Void) {
        preconditionFailure("This method must be overridden")
    }
}
