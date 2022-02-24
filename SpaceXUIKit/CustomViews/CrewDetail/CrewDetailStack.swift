//
//  CrewDetailStack.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 21.02.2022.
//

import UIKit

final class CrewDetailStack: UIStackView {
    
    let imageView: UIImageView = {
        let iv: UIImageView = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 10
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        return iv
    }()
    private let sectionLabel: SectionTitleLabel = SectionTitleLabel(titled: "General")
    let memberInfoStack: CrewMemberInfoStack
    private let linksLabel: SectionTitleLabel = SectionTitleLabel(titled: "Links")
    let wikiButton: LargeTintedButton

    init(vm: CrewDetailVM) {
        imageView.image = vm.memberPhoto
        memberInfoStack = CrewMemberInfoStack(vm: vm)
        wikiButton = LargeTintedButton(text: "Wikipedia")
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        spacing = ConstraintsHelper.mediumSpacing
        alignment = .leading
        // Subvies
        addArrangedSubview(imageView)
        addArrangedSubview(sectionLabel)
        addArrangedSubview(memberInfoStack)
        addArrangedSubview(linksLabel)
        addArrangedSubview(wikiButton)
        // UI Config
        NSLayoutConstraint.activate([
            // IMAGE
            imageView.widthAnchor.constraint(equalToConstant: ConstraintsHelper.screenSizeWithoutPadding),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            // BUTTON
            wikiButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            wikiButton.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
