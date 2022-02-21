//
//  AppearanceStack.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 15.02.2022.
//

import UIKit

final class AppearanceSettingsStack: UIStackView {
    
    private let title: SectionTitleLabel = {
        SectionTitleLabel(titled: "Appearance")
    }()
    let segmentedControl: UISegmentedControl = {
        let segControl: UISegmentedControl = UISegmentedControl(items: ["auto", "light", "dark"])
        segControl.translatesAutoresizingMaskIntoConstraints = false
        segControl.selectedSegmentTintColor = .systemYellow
        segControl.selectedSegmentIndex = 0
        return segControl
    }()

    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        alignment = .fill
        spacing = ConstraintsHelper.mediumSpacing
        // Subviews
        addArrangedSubview(title)
        addArrangedSubview(segmentedControl)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
