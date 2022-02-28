//
//  CrewMemberInfoStack.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 21.02.2022.
//

import UIKit

final class CrewMemberInfoStack: UIStackView {

    private let typeStack: CrewDetailTypeStack = CrewDetailTypeStack()
    private let infoStack: CrewDetailInfoContentStack
    
    init(vm: CrewDetailVM) {
        infoStack = CrewDetailInfoContentStack(vm: vm)
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        spacing = ConstraintsHelper.smallSpacing
        // Subviews
        addArrangedSubview(typeStack)
        addArrangedSubview(infoStack)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
