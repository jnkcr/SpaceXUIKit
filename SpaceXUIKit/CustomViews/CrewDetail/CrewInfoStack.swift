//
//  CrewInfoStack.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 21.02.2022.
//

import UIKit

class CrewInfoStack: UIStackView {
    
    private let sectionLabel: SectionTitleLabel = SectionTitleLabel(titled: "Infomations")
    let nameStack: CrewLineStack
    let agencyStack: CrewLineStack
    let statusStack: CrewLineStack
    let launchesStack: CrewLineStack
    let wikiButton: LargeTintedButton

    init(vm: CrewDetailVM) {
        nameStack = CrewLineStack(type: "Name", info: vm.nameDescription)
        agencyStack = CrewLineStack(type: "Agency", info: vm.agencyDescription)
        statusStack = CrewLineStack(type: "Status", info: vm.statusDescription)
        launchesStack = CrewLineStack(type: "Launches", info: vm.launchesDescription)
        wikiButton = LargeTintedButton(text: "Wikipedia")
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        spacing = ConstraintsHelper.mediumSpacing
        alignment = .leading
        // Subvies
        addArrangedSubview(sectionLabel)
        addArrangedSubview(nameStack)
        addArrangedSubview(agencyStack)
        addArrangedSubview(statusStack)
        addArrangedSubview(launchesStack)
        addArrangedSubview(wikiButton)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
