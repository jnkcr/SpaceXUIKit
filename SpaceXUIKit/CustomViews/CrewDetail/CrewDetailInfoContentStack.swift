//
//  CrewDetailInfoContentStack.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 21.02.2022.
//

import UIKit

class CrewDetailInfoContentStack: UIStackView {
    
    private let nameLabel: CrewInfoLabel
    private let agencyLabel: CrewInfoLabel
    private let statusLabel: CrewInfoLabel
    private let launchesLabel: CrewInfoLabel

    init(vm: CrewDetailVM) {
        nameLabel = CrewInfoLabel(titled: vm.nameDescription)
        agencyLabel = CrewInfoLabel(titled: vm.agencyDescription)
        statusLabel = CrewInfoLabel(titled: vm.statusDescription)
        launchesLabel = CrewInfoLabel(titled: vm.launchesDescription)
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
