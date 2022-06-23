//
//  HomeCollectionViewCell.swift
//  MovieApp2022
//
//  Created by Daniel Cano Platero on 22/6/22.
//

import UIKit
import Domain
//import Kingfisher

final class HomeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HomeCollectionViewCell"

    private let showImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let showTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Style.Fonts.titleFont
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        contentView.addAutolayoutView([showImageView, showTitleLabel])
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
//            showImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Style.Spacing.spacingS),
//            showImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Style.Spacing.spacingS),
//            showImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            showImageView.heightAnchor.constraint(equalToConstant: 40),
//            showImageView.widthAnchor.constraint(equalToConstant: 40),

            showTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            showTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            showTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            showTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
        ])
    }

    func configCell(with show: Show) {
        showTitleLabel.text = show.name
        //showImageView.kf.setImage(with: show.image.medium)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        showTitleLabel.text = ""
    }
}
