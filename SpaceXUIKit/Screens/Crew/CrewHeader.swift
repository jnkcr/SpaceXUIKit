//
//  CrewHeader.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 16.02.2022.
//

import UIKit

final class CrewHeader: UICollectionReusableView {
    
    static let reuseID: String = "crewHeader"
    
    let headerLabel: SectionTitleLabel = SectionTitleLabel(titled: "n/a")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        headerLabel.textColor = .secondaryLabel
        // Subviews
        addSubview(headerLabel)
        // UI Constraints
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
