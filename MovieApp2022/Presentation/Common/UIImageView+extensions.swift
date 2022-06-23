//
//  UIImageView+extensions.swift
//  MovieApp2022
//
//  Created by Daniel Cano Platero on 23/6/22.
//

import Foundation

import UIKit

extension UIImageView {
    func loadImage(url: String) {
        DispatchQueue.global().async { [weak self] in
            guard let url = URL(string: url) else { return }
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
