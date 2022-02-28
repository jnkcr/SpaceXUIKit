//
//  SectionTitleLabel.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 15.02.2022.
//

import UIKit

final class SectionTitleLabel: UILabel {

    convenience init(titled title: String, sized size: CGFloat = 20) {
        self.init()
        font = UIFont.systemFont(ofSize: size, weight: .bold)
        text = title
    }
    
    private init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .natural
        lineBreakMode = .byTruncatingTail
        numberOfLines = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
