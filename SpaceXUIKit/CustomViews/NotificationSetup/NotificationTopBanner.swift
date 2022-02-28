//
//  NotificationTopBanner.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 21.02.2022.
//

import UIKit

final class NotificationTopBanner: UIView {

    let cancelButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    private let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.text = "Notification Setup"
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemYellow
        // Subviews
        addSubview(cancelButton)
        addSubview(titleLabel)
        // UI Config
        NSLayoutConstraint.activate([
            // CANCEL
            cancelButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            cancelButton.leadingAnchor.constraint(equalTo: readableContentGuide.leadingAnchor),
            cancelButton.widthAnchor.constraint(equalToConstant: 30),
            cancelButton.heightAnchor.constraint(equalTo: cancelButton.widthAnchor),
            // TITLE
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
