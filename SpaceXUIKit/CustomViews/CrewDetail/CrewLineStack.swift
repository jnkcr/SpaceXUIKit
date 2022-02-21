//
//  CrewLineStack.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 21.02.2022.
//

import UIKit

class CrewLineStack: UIStackView {

    let typeLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = .secondaryLabel
        return label
    }()
    let infoLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = .label
        return label
    }()
    
    init(type: String, info: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        spacing = ConstraintsHelper.smallSpacing
        alignment = .leading
        // Subvies
        addArrangedSubview(typeLabel)
        addArrangedSubview(infoLabel)
        // Setup texts
        typeLabel.text = type + ":"
        infoLabel.text = info
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
