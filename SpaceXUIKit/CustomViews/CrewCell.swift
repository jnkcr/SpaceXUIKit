//
//  CrewCell.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 11.02.2022.
//

import UIKit

class CrewCell: UICollectionViewCell {
    
    static let reusableID: String = "crewCell"
    
    let photoView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "clever")
        return imageView
    }()
    let nameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.text = "Cosmoperson"
        return label
    }()
    let stackView: UIStackView = {
        let stack: UIStackView = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = ConstraintsHelper.smallSpacing
//        stack.alignment = .center
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .systemBackground
        // Subviews
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(photoView)
        stackView.addArrangedSubview(nameLabel)
        // UI Constraints
        NSLayoutConstraint.activate([
            // PHOTO
            photoView.widthAnchor.constraint(equalToConstant: contentView.bounds.width),
            photoView.heightAnchor.constraint(equalTo: photoView.widthAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
