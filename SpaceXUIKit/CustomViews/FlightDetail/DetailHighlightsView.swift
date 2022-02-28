//
//  DetailHighlightsView.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 08.02.2022.
//

import UIKit

final class DetailHighlightsView: UIStackView {
    
    let dateStack: DetailHighlightBlock = DetailHighlightBlock(iconName: "calendar.circle")
    let crewStack: DetailHighlightBlock = DetailHighlightBlock(iconName: "person.2.circle")
    let successStack: DetailHighlightBlock = DetailHighlightBlock(iconName: "checkmark.circle")
    
    init(dateDesc: String, crewDesc: String, successDesc: String, successImg: UIImage) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        alignment = .fill
        spacing = (ConstraintsHelper.mediumSpacing + ConstraintsHelper.smallSpacing)
        // Labels text
        dateStack.titleLabel.text = dateDesc
        crewStack.titleLabel.text = crewDesc
        successStack.titleLabel.text = successDesc
        successStack.icon.image = successImg
        // Subviews
        addArrangedSubview(dateStack)
        addArrangedSubview(crewStack)
        addArrangedSubview(successStack)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
