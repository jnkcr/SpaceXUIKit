//
//  CrewInfoLabel.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 21.02.2022.
//

import UIKit

class CrewInfoLabel: UILabel {

    init(titled title: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.preferredFont(forTextStyle: .headline)
        textAlignment = .natural
        textColor = .label
        lineBreakMode = .byTruncatingTail
        text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
