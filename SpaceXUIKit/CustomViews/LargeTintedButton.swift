//
//  LargeTintedButton.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 11.02.2022.
//

import UIKit

final class LargeTintedButton: UIButton {
    
    init(text: String, tint color: UIColor = .systemYellow) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        configuration = .tinted()
        configuration?.cornerStyle = .capsule
        configuration?.buttonSize = .large
        tintColor = color
        setTitle(text, for: .normal)
    }
    
    private init() {
        super.init(frame: .zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
