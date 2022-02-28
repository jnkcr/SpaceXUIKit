//
//  CrewDetailTypeStack.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 21.02.2022.
//

import UIKit

final class CrewDetailTypeStack: UIStackView {

    private let nameLabel: CrewTypeLabel     = CrewTypeLabel(titled: "Name")
    private let agencyLabel: CrewTypeLabel   = CrewTypeLabel(titled: "Agency")
    private let statusLabel: CrewTypeLabel   = CrewTypeLabel(titled: "Status")
    private let launchesLabel: CrewTypeLabel = CrewTypeLabel(titled: "Launches")
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        spacing = ConstraintsHelper.mediumSpacing
        alignment = .leading
        // Subviews
        addArrangedSubview(nameLabel)
        addArrangedSubview(agencyLabel)
        addArrangedSubview(statusLabel)
        addArrangedSubview(launchesLabel)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
