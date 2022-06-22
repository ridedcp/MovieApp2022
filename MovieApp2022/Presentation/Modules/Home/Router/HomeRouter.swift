//
//  HomeRouter.swift
//  MovieApp2022
//
//  Created by Daniel Cano Platero on 22/6/22.
//

import Foundation
import UIKit
import Domain

public class HomeRouter {
    
    func navigateToDetailView(navigation: UINavigationController, show: Show) {
        let viewController = FeatureAssembly.detailFeature(navigation, show)
        navigation.pushViewController(viewController, animated: true)
    }
}
