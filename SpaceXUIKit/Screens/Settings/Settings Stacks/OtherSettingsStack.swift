//
//  OtherSettingsStack.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 15.02.2022.
//

import UIKit

final class OtherSettingsStack: UIStackView {

    private let title: SectionTitleLabel = SectionTitleLabel(titled: "Other")
    let alertStack: ButtonAndTitleStack = ButtonAndTitleStack(labeled: "Show alert", buttonText: "Show")
    let notificationTimeStack: ButtonAndTitleStack = ButtonAndTitleStack(labeled: "Time-based notification", buttonText: "Get")
    let notificationCalendarStack: ButtonAndTitleStack = ButtonAndTitleStack(labeled: "Calendar-based notification", buttonText: "Set")
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        alignment = .fill
        spacing = ConstraintsHelper.mediumSpacing
        // Subviews
        addArrangedSubview(title)
        addArrangedSubview(alertStack)
        addArrangedSubview(notificationTimeStack)
        addArrangedSubview(notificationCalendarStack)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
