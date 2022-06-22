//
//  FeatureProvider.swift
//  MovieApp2022
//
//  Created by Daniel Cano Platero on 21/6/22.
//

import UIKit

public typealias ViewControllerProvider = (() -> UIViewController)
public typealias SingleParamOptionalViewControllerProvider<T> = ((T) -> UIViewController?)
public typealias NavigationControllerProvider = (() -> UINavigationController)

public typealias FeatureProvider = ((UINavigationController) -> UIViewController)
public typealias SingleParamFeatureProvider<T> = ((UINavigationController, T) -> UIViewController)
public typealias DoubleParamFeatureProvider<T, R> = ((UINavigationController, T, R) -> UIViewController)

