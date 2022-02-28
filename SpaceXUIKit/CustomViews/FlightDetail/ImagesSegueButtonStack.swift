//
//  ImagesSegueButtonStack.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 24.02.2022.
//

import UIKit

class ImagesSegueButtonStack: UIStackView {
    
    let sectionTitle: SectionTitleLabel = SectionTitleLabel(titled: "Flight images")
    let descriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textAlignment = .natural
        label.text = "Images available: 0"
        return label
    }()
    let segueButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.buttonSize = .medium
        button.tintColor = .systemYellow
        button.setTitle("Show", for: .normal)
        button.isEnabled = false
        return button
    }()
    let imageDescriptionStack: UIStackView = {
        let stack: UIStackView = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillProportionally
        return stack
    }()

    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        alignment = .fill
        spacing = ConstraintsHelper.mediumSpacing
        // Subviews
        imageDescriptionStack.addArrangedSubview(descriptionLabel)
        imageDescriptionStack.addArrangedSubview(segueButton)
        addArrangedSubview(sectionTitle)
        addArrangedSubview(imageDescriptionStack)
        // UI Config
        NSLayoutConstraint.activate([
            segueButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
