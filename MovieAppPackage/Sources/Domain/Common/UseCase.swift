//
//  File.swift
//  
//
//  Created by Daniel Cano Platero on 21/6/22.
//

import Foundation

public protocol UseCaseParams {}
public struct NotUseCaseParams: UseCaseParams {}

open class UseCase<P: UseCaseParams> {
}
