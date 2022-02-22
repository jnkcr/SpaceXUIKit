//
//  DateAndButtonStack.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 22.02.2022.
//

import UIKit

class DateAndButtonStack: UIStackView {
    
    let datePicker: UIDatePicker = {
        let picker: UIDatePicker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.datePickerMode = .dateAndTime
        picker.preferredDatePickerStyle = .inline
        picker.minimumDate = Date.now
        return picker
    }()
    let confirmationButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.configuration?.buttonSize = .large
        button.tintColor = .systemYellow
        button.setTitle("Notify me!", for: .normal)
        return button
    }()

    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        alignment = .fill
        spacing = ConstraintsHelper.largeSpacing
        // Subviews
        addArrangedSubview(datePicker)
        addArrangedSubview(confirmationButton)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
