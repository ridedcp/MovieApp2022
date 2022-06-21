//
//  File.swift
//  
//
//  Created by Daniel Cano Platero on 21/6/22.
//

import Foundation

public protocol SeriesRepository {
    func getShows(page: Int, completion: @escaping (Result<[Show], Swift.Error>) -> Void)
}
