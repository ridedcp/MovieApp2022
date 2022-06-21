//
//  File.swift
//  
//
//  Created by Daniel Cano Platero on 21/6/22.
//

import Foundation

public typealias ResultCompletion<T> = (Result<T, Error>) -> Void
public typealias DefaultCompletion = () -> Void
