//
//  DateAndTextFieldStack.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 22.02.2022.
//

import UIKit

class DateAndTextFieldStack: UIStackView {
    
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
        return field
    }()

    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        alignment = .fill
        spacing = ConstraintsHelper.mediumSpacing
        // Subviews
        addArrangedSubview(datePicker)
        addArrangedSubview(messageSectionLabel)
        addArrangedSubview(textField)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
