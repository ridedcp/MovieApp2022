//
//  UIView+Extensions.swift
//  MovieApp2022
//
//  Created by Daniel Cano Platero on 22/6/22.
//

import UIKit

extension UIView {
    func addAutolayoutView(_ views: [UIView]) {
        views.forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
