//
//  LoadingSwitchStack.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 15.02.2022.
//

import UIKit

final class SwitchAndTitleStack: UIStackView {
    
    private let title: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .justified
        label.text = "n/a"
        return label
    }()
    let switchControl: UISwitch = {
        let switcher: UISwitch = UISwitch()
        switcher.translatesAutoresizingMaskIntoConstraints = false
        switcher.onTintColor = .systemYellow
        switcher.preferredStyle = .automatic
        return switcher
    }()
    
    init(labeled text: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        spacing = ConstraintsHelper.smallSpacing
        title.text = text
        // Subviews
        addArrangedSubview(title)
        addArrangedSubview(switchControl)
        // UI
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
