//
//  BehaviourSettingsStack.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 15.02.2022.
//

import UIKit

class BehaviourSettingsStack: UIStackView {
    
    private let title: SectionTitleLabel = {
        return SectionTitleLabel(titled: "Behaviour")
    }()
    let crewLoadingSwitchStack: SwitchAndTitleStack = {
        return SwitchAndTitleStack(labeled: "Load crew on app start up")
    }()
    let firstRandomSwitchStack: SwitchAndTitleStack = {
        return SwitchAndTitleStack(labeled: "Non-funtional #01")
    }()
    let secondRandomSwitchStack: SwitchAndTitleStack = {
        return SwitchAndTitleStack(labeled: "Non-funtional #02")
    }()

    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        spacing = ConstraintsHelper.mediumSpacing
        alignment = .fill
        // Subviews
        addArrangedSubview(title)
        addArrangedSubview(crewLoadingSwitchStack)
        addArrangedSubview(firstRandomSwitchStack)
        addArrangedSubview(secondRandomSwitchStack)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
