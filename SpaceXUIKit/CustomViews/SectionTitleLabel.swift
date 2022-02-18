//
//  SectionTitleLabel.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 15.02.2022.
//

import UIKit

class SectionTitleLabel: UILabel {

    init(titled title: String, sized size: CGFloat = 20) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.systemFont(ofSize: size, weight: .bold)
        textAlignment = .natural
        lineBreakMode = .byTruncatingTail
        numberOfLines = 1
        text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
