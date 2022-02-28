//
//  NotificationSetupVC.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 21.02.2022.
//

import UIKit

final class NotificationSetupVC: UIViewController {
    
    let notificationCalendarVM: NotificationCalendarVM
    
    let topBanner: NotificationTopBanner = NotificationTopBanner()
    let dateAndButtonStack: DateAndButtonStack = DateAndButtonStack()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Subviews
        view.addSubview(topBanner)
        view.addSubview(dateAndButtonStack)
        // UI Config
        NSLayoutConstraint.activate([
            // BANNER
            topBanner.topAnchor.constraint(equalTo: view.topAnchor),
            topBanner.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topBanner.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topBanner.heightAnchor.constraint(equalToConstant: 50),
            // LABEL
            dateAndButtonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dateAndButtonStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        // Add targets
        topBanner.cancelButton.addTarget(self, action: #selector(handleCancellation), for: .touchUpInside)
        dateAndButtonStack.datePicker.addTarget(self, action: #selector(handlePickerChanges), for: .valueChanged)
        dateAndButtonStack.confirmationButton.addTarget(self, action: #selector(handleConfirmationButtonClick), for: .touchUpInside)
    }
    
    init(viewModel: NotificationCalendarVM = NotificationCalendarVM()) {
        notificationCalendarVM = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Target funcs

extension NotificationSetupVC {
    
    @objc
    func handleCancellation() {
        dismiss(animated: true)
    }
    
    @objc
    func handlePickerChanges() {
        notificationCalendarVM.datePicked = dateAndButtonStack.datePicker.date
    }
    
    @objc
    func handleConfirmationButtonClick() {
        notificationCalendarVM.scheduleCalendarBasedNotification()
        dismiss(animated: true)
    }
    
}
