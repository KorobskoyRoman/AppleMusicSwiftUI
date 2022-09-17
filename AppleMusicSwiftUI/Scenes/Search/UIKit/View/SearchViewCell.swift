//
//  SearchViewCell.swift
//  AppleMusicSwiftUI
//
//  Created by Roman Korobskoy on 14.09.2022.
//

import UIKit

final class SearchViewCell: UICollectionViewCell {
    static let reuseId = "SearchViewCell"
    private let image = UIImageView()
    private let title: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byTruncatingTail
        return lbl
    }()

    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
        title.text = nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10
        self.image.layer.cornerRadius = 10
        self.image.clipsToBounds = true
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
        applyGradient()

        backgroundColor = .white
        image.contentMode = .scaleAspectFill
        contentView.layer.cornerRadius = 10
        self.layer.cornerRadius = 10

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with model: SearchModel) {
        image.image = UIImage(named: model.image)
        title.text = model.title
    }

    private func applyGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.opacity = 0.4
        gradient.colors = [UIColor.systemBlue.cgColor, UIColor.systemCyan.cgColor, UIColor.systemRed.cgColor, UIColor.systemPink.cgColor]
        image.layer.insertSublayer(gradient, at: 0)
    }

    private func setConstraints() {
        contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor),

            title.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: -10),
            title.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -10)
        ])
    }
}
