//
//  FlightCell.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 04.02.2022.
//

import UIKit

class FlightCell: UITableViewCell {
    
    static let reusableID: String = "flightCell"
    var patchImage: UIImage? {
        didSet {
            flightPatchImage.image = patchImage
        }
    }
    var flightData: Flight? {
        didSet {
            flightDateLabel.text = CustomDateFormatter.formatUTCDate(from: flightData?.dateUtc, as: .long)
            flightNameLabel.text = flightData?.name
        }
    }
    
    let flightPatchImage: UIImageView = UIImageView()
    let flightInfoStack: UIStackView = UIStackView()
    let flightDateLabel: UILabel = UILabel()
    let flightNameLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Cell configuration:
        addSubviews()
        configureFlightImage()
        configureInfoView()
        configureDateLabel()
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

// MARK: - UI Configurations

extension FlightCell {
    
    private func addSubviews() {
        contentView.addSubview(flightPatchImage)
        contentView.addSubview(flightInfoStack)
        flightInfoStack.addArrangedSubview(flightDateLabel)
        flightInfoStack.addArrangedSubview(flightNameLabel)
    }
    
    private func configureFlightImage() {
        flightPatchImage.translatesAutoresizingMaskIntoConstraints = false
        flightPatchImage.tintColor = .systemYellow
        flightPatchImage.image = UIImage(systemName: "airplane.circle")
    }
    
    private func configureInfoView() {
        flightInfoStack.translatesAutoresizingMaskIntoConstraints = false
        flightInfoStack.axis = .vertical
        flightInfoStack.spacing = ConstraintsHelper.tinySpacing
    }
    
    private func configureDateLabel() {
        flightDateLabel.translatesAutoresizingMaskIntoConstraints = false
        flightDateLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        flightDateLabel.textColor = .secondaryLabel
        flightDateLabel.lineBreakMode = .byTruncatingTail
        flightDateLabel.adjustsFontSizeToFitWidth = false
    }
    
    private func configureFlightLabel() {
        flightNameLabel.translatesAutoresizingMaskIntoConstraints = false
        flightNameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        flightNameLabel.lineBreakMode = .byTruncatingTail
        flightNameLabel.adjustsFontSizeToFitWidth = false
    }
    
    private func addConstraints() {
        let size: CGFloat = 50
        
        // Image
        NSLayoutConstraint.activate([
            flightPatchImage.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor),
            flightPatchImage.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            flightPatchImage.widthAnchor.constraint(equalToConstant: size),
            flightPatchImage.heightAnchor.constraint(equalToConstant: size)
        ])
        
        // InfoView
        NSLayoutConstraint.activate([
            flightInfoStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            flightInfoStack.leadingAnchor.constraint(equalTo: flightPatchImage.trailingAnchor, constant: ConstraintsHelper.padding),
            flightInfoStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        // Date
        NSLayoutConstraint.activate([
            flightDateLabel.leadingAnchor.constraint(equalTo: flightInfoStack.leadingAnchor),
            flightDateLabel.trailingAnchor.constraint(equalTo: flightInfoStack.trailingAnchor),
        ])
        
        // Name
        NSLayoutConstraint.activate([
            flightNameLabel.leadingAnchor.constraint(equalTo: flightInfoStack.leadingAnchor),
            flightNameLabel.trailingAnchor.constraint(equalTo: flightInfoStack.trailingAnchor),
        ])
    }
    
}
