//
//  SectionHeader.swift
//  AppleMusicSwiftUI
//
//  Created by Roman Korobskoy on 14.09.2022.
//

import UIKit

final class SectionHeader: UICollectionReusableView {

    static let reuseId = "SectionHeader"
    let title = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        title.translatesAutoresizingMaskIntoConstraints = false
        addSubview(title)

        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    func configurate(text: String, font: UIFont?, textColor: UIColor) {
        title.textColor = textColor
        title.font = font
        title.text = text
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
