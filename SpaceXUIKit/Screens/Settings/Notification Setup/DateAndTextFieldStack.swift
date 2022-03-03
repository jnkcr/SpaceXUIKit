//
//  DateAndTextFieldStack.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 22.02.2022.
//

import UIKit

class DateAndTextFieldStack: UIStackView {
    
    let dateSectionLabel: SectionTitleLabel = SectionTitleLabel(titled: "Date")
    let messageSectionLabel: SectionTitleLabel = SectionTitleLabel(titled: "Message")
    let datePicker: UIDatePicker = {
        let picker: UIDatePicker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.datePickerMode = .dateAndTime
        picker.preferredDatePickerStyle = .inline
        picker.minimumDate = Date.now
        return picker
    }()
    let textField: UITextField = {
        let field: UITextField = UITextField()
        field.placeholder = "Notification message"
        field.keyboardType = .default
        field.keyboardAppearance = .default
        field.returnKeyType = .done
        field.borderStyle = .roundedRect
        field.clearButtonMode = .whileEditing
        return field
    }()

    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        alignment = .leading
        spacing = ConstraintsHelper.mediumSpacing
        // Subviews
        addArrangedSubview(dateSectionLabel)
        addArrangedSubview(datePicker)
        addArrangedSubview(messageSectionLabel)
        addArrangedSubview(textField)
        // UI Config
        NSLayoutConstraint.activate([
            datePicker.leadingAnchor.constraint(equalTo: leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
