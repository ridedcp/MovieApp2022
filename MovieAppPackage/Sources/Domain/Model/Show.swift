//
//  File.swift
//  
//
//  Created by Daniel Cano Platero on 21/6/22.
//

import Foundation

public struct Show: Equatable {

    public var id: Int
    public var name: String
    public var image: ShowImage
    
    public init(id: Int, name: String, image: ShowImage) {
        self.id = id
        self.name = name
        self.image = image
    }
}

public struct ShowImage: Equatable {
    public var medium: String
    public var original: String
    
    public init(medium: String, original: String) {
        self.medium = medium
        self.original = original
    }
}
