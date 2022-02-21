//
//  NotificationSetupVC.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 21.02.2022.
//

import UIKit

final class NotificationSetupVC: UIViewController {
    
    let topBanner: NotificationTopBanner = NotificationTopBanner()
    let titleLabel: SectionTitleLabel = SectionTitleLabel(titled: "Heeeeeelloooooo")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Subviews
        view.addSubview(topBanner)
        view.addSubview(titleLabel)
        // UI Config
        NSLayoutConstraint.activate([
            // BANNER
            topBanner.topAnchor.constraint(equalTo: view.topAnchor),
            topBanner.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topBanner.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topBanner.heightAnchor.constraint(equalToConstant: 50),
            // LABEL
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        // Add targets
        topBanner.cancelButton.addTarget(self, action: #selector(handleCancellation), for: .touchUpInside)
    }
    
}

// MARK: - Targets

extension NotificationSetupVC {
    
    @objc
    func handleCancellation() {
        dismiss(animated: true)
    }
    
}
