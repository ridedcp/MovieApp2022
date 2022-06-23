//
//  HomeCollectionViewCell.swift
//  MovieApp2022
//
//  Created by Daniel Cano Platero on 22/6/22.
//

import UIKit
import Domain

final class HomeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HomeCollectionViewCell"

    private let showImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        image.layer.borderWidth = 1
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()

    private let showTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Style.Fonts.titleFont
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
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
            showImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Style.Spacing.spacingS),
            showImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Style.Spacing.spacingS),
            showImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            showImageView.bottomAnchor.constraint(equalTo: showTitleLabel.topAnchor, constant: -Style.Spacing.spacingS),

            showTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            showTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            showTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    func configCell(with show: Show) {
        showTitleLabel.text = show.name
        showImageView.loadImage(url: show.image.medium)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        showTitleLabel.text = ""
    }
}
