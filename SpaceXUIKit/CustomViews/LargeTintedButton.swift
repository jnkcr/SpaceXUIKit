//
//  LargeTintedButton.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 11.02.2022.
//

import UIKit

final class LargeTintedButton: UIButton {
    
    convenience init(text: String, tint color: UIColor = .systemYellow) {
        self.init()
        setTitle(text, for: .normal)
        tintColor = color
    }
    
    private init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        configuration = .tinted()
        configuration?.cornerStyle = .capsule
        configuration?.buttonSize = .large
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
