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
    
    let settingsVM: SettingsVM = SettingsVM()
    
    let statusLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "Automatic"
        return label
    }()
    let autoStyleButton: LargeTintedButton = {
        let button: LargeTintedButton = LargeTintedButton(text: "Automatic")
        button.addTarget(self, action: #selector(handleAutomatic), for: .touchUpInside)
        return button
    }()
    let lightStyleButton: LargeTintedButton = {
        let button: LargeTintedButton = LargeTintedButton(text: "Light")
        button.addTarget(self, action: #selector(handleLight), for: .touchUpInside)
        return button
    }()
    let darkStyleButton: LargeTintedButton = {
        let button: LargeTintedButton = LargeTintedButton(text: "Dark")
        button.addTarget(self, action: #selector(handleDark), for: .touchUpInside)
        return button
    }()
    let switcher: UISwitch = {
        let switcher = UISwitch()
        switcher.translatesAutoresizingMaskIntoConstraints = false
        switcher.onTintColor = .systemYellow
        switcher.preferredStyle = .automatic
        switcher.addTarget(self, action: #selector(handleSwitch), for: .valueChanged)
        return switcher
    }()
    let segmentedControl: UISegmentedControl = {
        let segControl: UISegmentedControl = UISegmentedControl(items: ["auto", "light", "dark"])
        segControl.translatesAutoresizingMaskIntoConstraints = false
        segControl.selectedSegmentTintColor = .systemYellow
        segControl.selectedSegmentIndex = 0
        return segControl
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
        view.addSubview(switcher)
        view.addSubview(segmentedControl)
        // UI Constraints
        let buttonWidth: CGFloat = 200
        NSLayoutConstraint.activate([
            // STATUS
            statusLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -180),
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
            // SWITCH
            switcher.topAnchor.constraint(equalTo: darkStyleButton.bottomAnchor, constant: ConstraintsHelper.largeSpacing),
            switcher.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // SEGMENTED CONTROL
            segmentedControl.topAnchor.constraint(equalTo: switcher.bottomAnchor, constant: ConstraintsHelper.largeSpacing),
            segmentedControl.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        setupSwitch()
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
    
    @objc
    func handleSwitch() {
        switch switcher.isOn {
        case true:
            settingsVM.isLoadingCrewRightAway = true
        case false:
            settingsVM.isLoadingCrewRightAway = false
        }
    }
    
    func setupSwitch() {
        switch settingsVM.isLoadingCrewRightAway {
        case true:
            switcher.setOn(true, animated: true)
        case false:
            switcher.setOn(false, animated: true)
        }
    }
    
}
