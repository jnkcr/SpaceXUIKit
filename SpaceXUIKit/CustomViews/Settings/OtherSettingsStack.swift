//
//  OtherSettingsStack.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 15.02.2022.
//

import UIKit

class OtherSettingsStack: UIStackView {

    private let title: SectionTitleLabel = {
        SectionTitleLabel(titled: "Other")
    }()
    let notificationStack: ButtonAndTitleStack = {
        ButtonAndTitleStack(labeled: "Local notification", buttonText: "Get")
    }()
    let alertStack: ButtonAndTitleStack = {
        ButtonAndTitleStack(labeled: "Show alert", buttonText: "Show")
    }()
    let secondRandomStack: ButtonAndTitleStack = {
        ButtonAndTitleStack(labeled: "Non-functional #02", buttonText: "Go")
    }()
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        alignment = .fill
        spacing = ConstraintsHelper.mediumSpacing
        // Subviews
        addArrangedSubview(title)
        addArrangedSubview(notificationStack)
        addArrangedSubview(alertStack)
        addArrangedSubview(secondRandomStack)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
