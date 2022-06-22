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
        return image
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        return stackView
    }()
    
    private let showTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Style.Fonts.titleFont
        return label
    }()
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setupView() {
        contentView.addAutolayoutView([showImageView, stackView])
        stackView.addArrangedSubview(showTitleLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            showImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Style.Spacing.spacingS),
            showImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Style.Spacing.spacingS),
            showImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            showImageView.heightAnchor.constraint(equalToConstant: 40),
            showImageView.widthAnchor.constraint(equalToConstant: 40),
            
            stackView.centerYAnchor.constraint(equalTo: showImageView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: showImageView.trailingAnchor, constant: Style.Spacing.spacingM),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Style.Spacing.spacingL),
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
