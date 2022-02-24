//
//  DetailHighlightsView.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 08.02.2022.
//

import UIKit

final class DetailHighlightsView: UIStackView {
    
    let dStack: DetailHighlightBlock = {
        DetailHighlightBlock(iconName: "calendar.circle")
    }()
    let cStack: DetailHighlightBlock = {
        DetailHighlightBlock(iconName: "person.2.circle")
    }()
    let sStack: DetailHighlightBlock = {
        DetailHighlightBlock(iconName: "checkmark.circle")
    }()
    
    init(dateDesc: String, crewDesc: String, successDesc: String, successImg: UIImage) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        alignment = .fill
        spacing = (ConstraintsHelper.mediumSpacing + ConstraintsHelper.smallSpacing)
        // Labels text
        dStack.titleLabel.text = dateDesc
        cStack.titleLabel.text = crewDesc
        sStack.titleLabel.text = successDesc
        sStack.icon.image = successImg
        // Subviews
        addArrangedSubview(dStack)
        addArrangedSubview(cStack)
        addArrangedSubview(sStack)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
