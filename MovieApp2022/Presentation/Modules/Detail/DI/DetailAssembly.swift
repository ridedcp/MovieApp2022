//
//  DetailAssembly.swift
//  MovieApp2022
//
//  Created by Daniel Cano Platero on 22/6/22.
//

import UIKit.UINavigationController
import Domain

public class DetailAssembly {
    
    private let navigationController: UINavigationController
    var show: Show
    
    public init(navigationController: UINavigationController, show: Show) {
        self.navigationController = navigationController
        self.show = show
    }
    
    public func build() -> UIViewController {
        return DetailViewController(show: show)
    }
}

