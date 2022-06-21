//
//  File.swift
//  
//
//  Created by Daniel Cano Platero on 21/6/22.
//

import Foundation

public protocol Mapper {
    associatedtype Input
    associatedtype Output
    
    static func map(input: Input) -> Output
}

extension Mapper {
    public static func map(inputs: [Input]) -> [Output] {
        return inputs.map { value in map(input: value) }
    }
}

extension Mapper {
    
    public static func optionalMap(input: Input?) -> Output? {
        guard let input = input else {
            return nil
        }
        return map(input: input)
    }
}
