//
//  SettingsStack.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 15.02.2022.
//

import UIKit

class SettingsStack: UIStackView {
    
    let appearanceSection: AppearanceSettingsStack = {
        AppearanceSettingsStack()
    }()
    let behaviourSection: BehaviourSettingsStack = {
        BehaviourSettingsStack()
    }()
    let otherSection: OtherSettingsStack = {
        OtherSettingsStack()
    }()

    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        alignment = .fill
        spacing = ConstraintsHelper.largeSpacing
        // Subviews
        addArrangedSubview(appearanceSection)
        addArrangedSubview(behaviourSection)
        addArrangedSubview(otherSection)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
