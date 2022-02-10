//
//  SettingsVC.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 10.02.2022.
//

import UIKit

protocol AppearanceDelegate {
    func didChangeAppearanceStyle(to style: UIUserInterfaceStyle)
}

class SettingsVC: UIViewController {
    
    let statusLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "Automatic"
        return label
    }()
    let autoStyleButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .tinted()
        button.configuration?.cornerStyle = .capsule
        button.tintColor = .systemYellow
        button.setTitle("Automatic", for: .normal)
        button.addTarget(self, action: #selector(handleAutomatic), for: .touchUpInside)
        return button
    }()
    let lightStyleButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .tinted()
        button.configuration?.cornerStyle = .capsule
        button.tintColor = .systemYellow
        button.setTitle("Light", for: .normal)
        button.addTarget(self, action: #selector(handleLight), for: .touchUpInside)
        return button
    }()
    let darkStyleButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .tinted()
        button.configuration?.cornerStyle = .capsule
        button.tintColor = .systemYellow
        button.setTitle("Dark", for: .normal)
        button.addTarget(self, action: #selector(handleDark), for: .touchUpInside)
        return button
    }()
    
    var appearanceDelegate: AppearanceDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Settings"
        // Subviews
        view.addSubview(statusLabel)
        view.addSubview(autoStyleButton)
        view.addSubview(lightStyleButton)
        view.addSubview(darkStyleButton)
        // UI Constraints
        let buttonWidth: CGFloat = 200
        NSLayoutConstraint.activate([
            // STATUS
            statusLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -120),
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // AUTOMATIC
            autoStyleButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor,constant: ConstraintsHelper.largeSpacing),
            autoStyleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            autoStyleButton.widthAnchor.constraint(equalToConstant: buttonWidth),
            autoStyleButton.heightAnchor.constraint(equalToConstant: 50),
            // LIGHT
            lightStyleButton.topAnchor.constraint(equalTo: autoStyleButton.bottomAnchor,constant: ConstraintsHelper.smallSpacing),
            lightStyleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lightStyleButton.widthAnchor.constraint(equalToConstant: buttonWidth),
            lightStyleButton.heightAnchor.constraint(equalToConstant: 50),
            // DARK
            darkStyleButton.topAnchor.constraint(equalTo: lightStyleButton.bottomAnchor,constant: ConstraintsHelper.smallSpacing),
            darkStyleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            darkStyleButton.widthAnchor.constraint(equalToConstant: buttonWidth),
            darkStyleButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}

extension SettingsVC {
    
    @objc
    private func handleAutomatic() {
        statusLabel.text = "Automatic"
        appearanceDelegate?.didChangeAppearanceStyle(to: .unspecified)
    }
    
    @objc
    private func handleLight() {
        statusLabel.text = "Light"
        appearanceDelegate?.didChangeAppearanceStyle(to: .light)
    }
    
    @objc
    private func handleDark() {
        statusLabel.text = "Dark"
        appearanceDelegate?.didChangeAppearanceStyle(to: .dark)
    }
    
}
