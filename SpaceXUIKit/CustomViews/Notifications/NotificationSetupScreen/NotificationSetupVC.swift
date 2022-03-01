//
//  NotificationSetupVC.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 21.02.2022.
//

import UIKit

final class NotificationSetupVC: UIViewController {
    
    let notificationCalendarVM: NotificationCalendarVM
    lazy var tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
    
    let topBanner: NotificationTopBanner = NotificationTopBanner()
    let dateAndFieldStack: DateAndTextFieldStack = DateAndTextFieldStack()
    let confirmationButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.configuration?.buttonSize = .large
        button.tintColor = .systemYellow
        button.setTitle("Notify me!", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Subviews
        view.addSubview(topBanner)
        view.addSubview(dateAndFieldStack)
        view.addSubview(confirmationButton)
        // Textfield delegate
        dateAndFieldStack.textField.delegate = self
        // Tap gesture
        view.addGestureRecognizer(tap)
        // UI Config
        NSLayoutConstraint.activate([
            // BANNER
            topBanner.topAnchor.constraint(equalTo: view.topAnchor),
            topBanner.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topBanner.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topBanner.heightAnchor.constraint(equalToConstant: 50),
            // LABEL
            dateAndFieldStack.topAnchor.constraint(equalTo: topBanner.bottomAnchor, constant: ConstraintsHelper.mediumSpacing),
            dateAndFieldStack.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            dateAndFieldStack.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            // BUTTON
            confirmationButton.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            confirmationButton.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            confirmationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -ConstraintsHelper.largeSpacing),
        ])
        // Add targets
        topBanner.cancelButton.addTarget(self, action: #selector(handleCancellation), for: .touchUpInside)
        dateAndFieldStack.datePicker.addTarget(self, action: #selector(handlePickerChanges), for: .valueChanged)
        dateAndFieldStack.textField.addTarget(self, action: #selector(handleTextFieldChanges), for: .valueChanged)
        confirmationButton.addTarget(self, action: #selector(handleConfirmationButtonClick), for: .touchUpInside)
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
        notificationCalendarVM.datePicked = dateAndFieldStack.datePicker.date
    }
    
    @objc
    func handleTextFieldChanges() {
        notificationCalendarVM.textfieldInput = dateAndFieldStack.textField.text ?? ""
    }
    
    @objc
    func handleConfirmationButtonClick() {
        notificationCalendarVM.scheduleCalendarBasedNotification { result in
            switch result {
            case .success():
                dismiss(animated: true)
            case .failure(_):
                shownCustomAlert(title: "Warning", description: "You are tring to set notification in past. Please select a date in future.", confirmationText: "Alright!")
            }
        }
    }
    
    @objc
    func resingTextfieldByTapGesture() {
        dateAndFieldStack.textField.resignFirstResponder()
    }
    
}

//  MARK: - Textfield delegate funcs

extension NotificationSetupVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        notificationCalendarVM.textfieldInput = textField.text ?? ""
        return dateAndFieldStack.textField.resignFirstResponder()
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        notificationCalendarVM.textfieldInput = textField.text ?? ""
        return dateAndFieldStack.textField.resignFirstResponder()
    }
    
}
