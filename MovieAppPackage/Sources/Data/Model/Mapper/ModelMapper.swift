//
//  File.swift
//  
//
//  Created by Daniel Cano Platero on 21/6/22.
//

import Foundation
import Domain

public struct ModelMapper: Mapper {
    
    static public func mapImage(input: ShowImageResponse) -> ShowImage {
        ShowImage(medium: input.medium, original: input.original)
    }
    
    static public func map(input: [ShowResponse]) -> [Show] {
        return input.map { itemk -> Show in
            Show(id: itemk.id, name: itemk.name, image: mapImage(input: itemk.image))
        }
     
    }
}
