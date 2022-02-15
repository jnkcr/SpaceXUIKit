//
//  ButtonAndTitleStack.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 15.02.2022.
//

import UIKit

class ButtonAndTitleStack: UIStackView {
    
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
    let button: UIButton = {
        let btn: UIButton = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.configuration = .filled()
        btn.configuration?.buttonSize = .medium
        btn.configuration?.cornerStyle = .capsule
        btn.tintColor = .systemYellow
        return btn
    }()

    init(labeled text: String, buttonText: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        spacing = ConstraintsHelper.smallSpacing
        title.text = text
        button.setTitle(buttonText, for: .normal)
        // Subviews
        addArrangedSubview(title)
        addArrangedSubview(button)
        // UI Constraints
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
