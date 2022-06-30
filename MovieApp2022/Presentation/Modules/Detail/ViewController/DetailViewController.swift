//
//  DetailViewController.swift
//  MovieApp2022
//
//  Created by Daniel Cano Platero on 22/6/22.
//

import UIKit
import Domain

class DetailViewController: UIViewController {
    
    let show: Show
    
    private let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = image.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        image.addSubview(blurEffectView)
        return image
    }()
    
    private let showImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var showTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Style.Fonts.titleFont
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    public init(show: Show) {
        self.show = show
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        self.navigationController?.navigationBar.tintColor = .white
        view.backgroundColor = .white
        view.addSubview(backgroundImageView)
        view.addSubview(showImageView)
        view.addSubview(showTitleLabel)
        backgroundImageView.loadImage(url: show.image.original)
        showImageView.loadImage(url: show.image.original)
        showTitleLabel.text = show.name
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            showImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            showImageView.widthAnchor.constraint(equalTo:  view.widthAnchor),
            showImageView.heightAnchor.constraint(equalToConstant: 250),
            
            showTitleLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Style.Spacing.spacingL),
            showTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            showTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            showTitleLabel.widthAnchor.constraint(equalToConstant: Style.Spacing.spacingXL),
        ])
    }
}
