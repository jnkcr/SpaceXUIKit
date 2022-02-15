//
//  SectionTitleLabel.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 15.02.2022.
//

import UIKit

class SectionTitleLabel: UILabel {

    init(titled title: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.systemFont(ofSize: 20, weight: .bold)
        textAlignment = .natural
        lineBreakMode = .byTruncatingTail
        numberOfLines = 1
        text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
