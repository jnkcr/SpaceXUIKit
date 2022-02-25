//
//  FlightImagesCell.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 25.02.2022.
//

import UIKit

class FlightImagesCell: UITableViewCell {
    
    static let reuseID: String = "flightImagesCell"
    
    let flightImageView: UIImageView = {
        let imgView: UIImageView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.layer.cornerRadius = 10
        imgView.clipsToBounds = true
        return imgView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        translatesAutoresizingMaskIntoConstraints = false
        // Subviews
        contentView.addSubview(flightImageView)
        // UI Config
        NSLayoutConstraint.activate([
            flightImageView.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor),
            flightImageView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor),
            flightImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: ConstraintsHelper.tinySpacing),
            flightImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -ConstraintsHelper.tinySpacing),
            flightImageView.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        contentView.backgroundColor = .systemBackground
    }

}
