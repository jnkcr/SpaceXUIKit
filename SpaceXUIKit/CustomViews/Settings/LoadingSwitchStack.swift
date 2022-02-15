//
//  LoadingSwitchStack.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 15.02.2022.
//

import UIKit

class LoadingSwitchStack: UIStackView {
    
    private let title: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .justified
        label.text = "Load crew on start up"
        return label
    }()
    let switchControl: UISwitch = {
        let switcher = UISwitch()
        switcher.translatesAutoresizingMaskIntoConstraints = false
        switcher.onTintColor = .systemYellow
        switcher.preferredStyle = .automatic
        return switcher
    }()
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        spacing = ConstraintsHelper.smallSpacing
        // Subviews
        addArrangedSubview(title)
        addArrangedSubview(switchControl)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
