//
//  File.swift
//  
//
//  Created by Daniel Cano Platero on 21/6/22.
//

import Foundation

public struct ShowResponse: Decodable, Encodable {
    var id: Int
    var name: String
    var image: ShowImageResponse
}

public struct ShowImageResponse: Codable {
    var medium: String
    var original: String
}
