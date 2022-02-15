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
    var appearanceDelegate: AppearanceDelegate?
    
    let appearanceStack: AppearanceSettingsStack = {
        let stack: AppearanceSettingsStack = AppearanceSettingsStack()
        stack.segmentedControl.addTarget(self, action: #selector(handleSegmentedControl), for: .valueChanged)
        return stack
    }()
    let behaviorStack: BehaviourSettingsStack = {
        let stack: BehaviourSettingsStack = BehaviourSettingsStack()
        stack.crewLoadingSwitchStack.switchControl.addTarget(self, action: #selector(handleSwitch), for: .valueChanged)
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Settings"
        // Subviews
        view.addSubview(appearanceStack)
        view.addSubview(behaviorStack)
        // UI Constraints
        NSLayoutConstraint.activate([
            // SEGMENTED CONTROL
            appearanceStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
            appearanceStack.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            appearanceStack.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            // SWITCH STACK
            behaviorStack.topAnchor.constraint(equalTo: appearanceStack.bottomAnchor, constant: ConstraintsHelper.largeSpacing),
            behaviorStack.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            behaviorStack.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        behaviorStack.crewLoadingSwitchStack.switchControl.setOn(settingsVM.getSwitchState(), animated: true)
        appearanceStack.segmentedControl.selectedSegmentIndex = settingsVM.appearanceKey
    }
    
}

// MARK: - Targets

extension SettingsVC {
    
    @objc
    func handleSwitch() {
        settingsVM.isLoadingCrewRightAway = behaviorStack.crewLoadingSwitchStack.switchControl.isOn
    }
    
    @objc
    func handleSegmentedControl() {
        settingsVM.appearanceKey = appearanceStack.segmentedControl.selectedSegmentIndex
        appearanceDelegate?.didChangeAppearanceStyle(to: settingsVM.getInterfaceStyle())
    }
    
}
