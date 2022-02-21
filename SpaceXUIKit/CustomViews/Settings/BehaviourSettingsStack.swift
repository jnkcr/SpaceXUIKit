//
//  BehaviourSettingsStack.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 15.02.2022.
//

import UIKit

final class BehaviourSettingsStack: UIStackView {
    
    private let title: SectionTitleLabel = {
        SectionTitleLabel(titled: "Behaviour")
    }()
    let crewLoadingSwitchStack: SwitchAndTitleStack = {
        SwitchAndTitleStack(labeled: "Load crew on start-up")
    }()
    let firstRandomSwitchStack: SwitchAndTitleStack = {
        SwitchAndTitleStack(labeled: "Non-funtional #01")
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
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
