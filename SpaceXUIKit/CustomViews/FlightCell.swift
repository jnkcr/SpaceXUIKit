//
//  FlightCell.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 04.02.2022.
//

import UIKit

class FlightCell: UITableViewCell {
    
    static let reusableID: String = "flightCell"
    var flightData: CellData? {
        didSet {
            patchImage.image = flightData?.image ?? UIImage(systemName: "airplane.circle")
            dateLabel.text = flightData?.date
            titleLabel.text = flightData?.title
        }
    }
    
    private let patchImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .systemYellow
        imageView.image = UIImage(systemName: "airplane.circle")
        return imageView
    }()
    private let infoStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = ConstraintsHelper.tinySpacing
        return stack
    }()
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.textColor = .secondaryLabel
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontSizeToFitWidth = false
        return label
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontSizeToFitWidth = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Subviews
        contentView.addSubview(patchImage)
        contentView.addSubview(infoStack)
        infoStack.addArrangedSubview(dateLabel)
        infoStack.addArrangedSubview(titleLabel)
        // UI Configuration
        let size: CGFloat = 50
        NSLayoutConstraint.activate([
            // PATCH IMAGE
            patchImage.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
            patchImage.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            patchImage.widthAnchor.constraint(equalToConstant: size),
            patchImage.heightAnchor.constraint(equalToConstant: size),
            // STACK
            infoStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            infoStack.leadingAnchor.constraint(equalTo: patchImage.trailingAnchor, constant: ConstraintsHelper.padding),
            infoStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            // DATE
            dateLabel.leadingAnchor.constraint(equalTo: infoStack.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: infoStack.trailingAnchor),
            // FLIGHT TITLE
            titleLabel.leadingAnchor.constraint(equalTo: infoStack.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: infoStack.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
