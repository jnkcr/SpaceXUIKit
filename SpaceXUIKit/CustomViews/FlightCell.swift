//
//  FlightCell.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 04.02.2022.
//

import UIKit

class FlightCell: UITableViewCell {
    
    static let reusableID: String = "flightCell"
    let flightImage: UIImageView = UIImageView()
    let flightLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Cell configuration:
        addSubviews()
        configureFlightImage()
        configureFlightLabel()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}

extension FlightCell {
    
    private func addSubviews() {
        contentView.addSubview(flightImage)
        contentView.addSubview(flightLabel)
    }
    
    private func configureFlightImage() {
        flightImage.translatesAutoresizingMaskIntoConstraints = false
        flightImage.image = UIImage(systemName: "airplane.circle")
        flightImage.tintColor = .secondaryLabel
    }
    
    private func configureFlightLabel() {
        flightLabel.translatesAutoresizingMaskIntoConstraints = false
        flightLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        flightLabel.tintColor = .systemIndigo
    }
    
    private func addConstraints() {
        let padding: CGFloat = 16
        let size: CGFloat = 40
        
        // Image constraints
        NSLayoutConstraint.activate([
            flightImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            flightImage.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            flightImage.widthAnchor.constraint(equalToConstant: size),
            flightImage.heightAnchor.constraint(equalToConstant: size)
        ])
        
        // Label constraints
        NSLayoutConstraint.activate([
            flightLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            flightLabel.leadingAnchor.constraint(equalTo: flightImage.trailingAnchor, constant: padding),
            flightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            flightLabel.heightAnchor.constraint(equalToConstant: size)
        ])
    }
    
}
