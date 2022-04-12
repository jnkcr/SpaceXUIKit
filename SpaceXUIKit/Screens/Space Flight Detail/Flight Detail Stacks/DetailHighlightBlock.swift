//
//  DetailHighlightBlock.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 17.02.2022.
//

import UIKit

final class DetailHighlightBlock: UIStackView {
    
    let icon: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "calendar.circle")
        imageView.tintColor = .systemYellow
        return imageView
    }()
    let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textAlignment = .center
        return label
    }()

    init(iconName: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        // Setup
        icon.image = UIImage(systemName: iconName)
        axis = .vertical
        alignment = .center
        spacing = ConstraintsHelper.tinySpacing
        // Subviews
        addArrangedSubview(icon)
        addArrangedSubview(titleLabel)
        // UI Constraints
        let imageSize: CGFloat = 50
        NSLayoutConstraint.activate([
            icon.widthAnchor.constraint(equalToConstant: imageSize),
            icon.heightAnchor.constraint(equalToConstant: imageSize),
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
