//
//  SettingsVC.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 10.02.2022.
//

import UIKit
import UserNotifications

protocol AppearanceDelegate {
    func didChangeAppearanceStyle(to style: UIUserInterfaceStyle)
}

final class SettingsVC: UIViewController {
    
    let settingsVM: SettingsVM = SettingsVM()
    var appearanceDelegate: AppearanceDelegate?
    
    let scrollView: UIScrollView = {
        let sv: UIScrollView = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.alwaysBounceVertical = true
        sv.showsVerticalScrollIndicator = false
        return sv
    }()
    let settingsStack: SettingsStack = {
        let stack: SettingsStack = SettingsStack()
        stack.appearanceSection.segmentedControl.addTarget(self, action: #selector(handleSegmentedControl), for: .valueChanged)
        stack.behaviourSection.crewLoadingSwitchStack.switchControl.addTarget(self, action: #selector(handleSwitch), for: .valueChanged)
        stack.otherSection.alertStack.button.addTarget(self, action: #selector(handleAlert), for: .touchUpInside)
        stack.otherSection.notificationTimeStack.button.addTarget(self, action: #selector(handleTimeNotification), for: .touchUpInside)
        stack.otherSection.notificationCalendarStack.button.addTarget(self, action: #selector(handleCalendarNotification), for: .touchUpInside)
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Settings"
        // Subviews
        view.addSubview(scrollView)
        scrollView.addSubview(settingsStack)
        // UI Constraints
        NSLayoutConstraint.activate([
            // SCROLLVIEW
            scrollView.topAnchor.constraint(equalTo: view.readableContentGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.readableContentGuide.bottomAnchor),
            scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: settingsStack.topAnchor),
            scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: settingsStack.leadingAnchor),
            scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: settingsStack.trailingAnchor),
            scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: settingsStack.bottomAnchor),
            // SETTINGS
            settingsStack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ConstraintsHelper.mediumSpacing),
            settingsStack.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            settingsStack.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        settingsStack.appearanceSection.segmentedControl.selectedSegmentIndex = settingsVM.appearanceKey
        settingsStack.behaviourSection.crewLoadingSwitchStack.switchControl.setOn(settingsVM.getSwitchState(), animated: true)
    }
    
}

// MARK: - Targets

extension SettingsVC {
    
    @objc
    func handleSwitch() {
        settingsVM.isLoadingCrewRightAway = settingsStack.behaviourSection.crewLoadingSwitchStack.switchControl.isOn
    }
    
    @objc
    func handleSegmentedControl() {
        settingsVM.appearanceKey = settingsStack.appearanceSection.segmentedControl.selectedSegmentIndex
        appearanceDelegate?.didChangeAppearanceStyle(to: settingsVM.getInterfaceStyle())
    }
    
    @objc
    private func handleAlert() {
        shownCustomAlert(title: "Alert", description: "This is a generic text showcasing alert visuals.", confirmationText: "I like it")
    }
    
    @objc
    func handleTimeNotification() {
        settingsVM.showTestingLocalNotification()
    }
    
    @objc
    func handleCalendarNotification() {
        DispatchQueue.main.async {
            let vc = NotificationSetupVC()
            vc.modalPresentationStyle = .automatic
            vc.modalTransitionStyle = .coverVertical
            self.present(vc, animated: true)
        }
    }
    
}
