//
//  DetailLinksStack.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 09.02.2022.
//

import UIKit

final class DetailLinksStack: UIStackView {
    
    var links: FlightButtonLinks?

    let titleLabel: SectionTitleLabel = SectionTitleLabel(titled: "External links")
    let articleButton: LargeTintedButton = {
        let button: LargeTintedButton = LargeTintedButton(text: "Article")
        button.addTarget(self, action: #selector(handleArticle), for: .touchUpInside)
        return button
    }()
    let wikipediaButton: LargeTintedButton = {
        let button: LargeTintedButton = LargeTintedButton(text: "Wikipedia")
        button.addTarget(self, action: #selector(handleWiki), for: .touchUpInside)
        return button
    }()
    let youtubeButton: LargeTintedButton = {
        let button: LargeTintedButton = LargeTintedButton(text: "Youtube")
        button.addTarget(self, action: #selector(handleYoutube), for: .touchUpInside)
        return button
    }()
    private lazy var writtenTextButtonsStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = ConstraintsHelper.smallSpacing
        return stack
    }()
    private lazy var allButtonsStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = ConstraintsHelper.smallSpacing
        return stack
    }()
    
    init(links: FlightButtonLinks) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        spacing = ConstraintsHelper.mediumSpacing
        axis = .vertical
        alignment = .center
        self.links = links
        // Add target to buttons
        articleButton.addTarget(self, action: #selector(handleArticle), for: .touchUpInside)
        wikipediaButton.addTarget(self, action: #selector(handleWiki), for: .touchUpInside)
        youtubeButton.addTarget(self, action: #selector(handleYoutube), for: .touchUpInside)
        // Subviews
        addArrangedSubview(titleLabel)
        addArrangedSubview(allButtonsStack)
        allButtonsStack.addArrangedSubview(writtenTextButtonsStack)
        allButtonsStack.addArrangedSubview(youtubeButton)
        writtenTextButtonsStack.addArrangedSubview(articleButton)
        writtenTextButtonsStack.addArrangedSubview(wikipediaButton)
        // UI Constraints
        NSLayoutConstraint.activate([
            articleButton.topAnchor.constraint(equalTo: writtenTextButtonsStack.topAnchor),
            articleButton.bottomAnchor.constraint(equalTo: writtenTextButtonsStack.bottomAnchor),
            articleButton.widthAnchor.constraint(equalToConstant: ConstraintsHelper.screenSizeWithoutSmallPaddingAndSpacingDividedByTwo),
            wikipediaButton.topAnchor.constraint(equalTo: writtenTextButtonsStack.topAnchor),
            wikipediaButton.bottomAnchor.constraint(equalTo: writtenTextButtonsStack.bottomAnchor),
            wikipediaButton.widthAnchor.constraint(equalToConstant: ConstraintsHelper.screenSizeWithoutSmallPaddingAndSpacingDividedByTwo),
            youtubeButton.widthAnchor.constraint(equalToConstant: ConstraintsHelper.screenSizeWithoutPadding),
            writtenTextButtonsStack.leadingAnchor.constraint(equalTo: allButtonsStack.leadingAnchor),
            writtenTextButtonsStack.trailingAnchor.constraint(equalTo: allButtonsStack.trailingAnchor),
            allButtonsStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            allButtonsStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: ConstraintsHelper.screenSizeWithoutPadding)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DetailLinksStack {
    
    @objc
    func handleArticle() {
        guard let links = links else { fatalError("This really did not work as expected") }
        UIApplication.shared.open(links.articleURL)
    }
    
    @objc
    func handleWiki() {
        guard let links = links else { fatalError("This really did not work as expected") }
        UIApplication.shared.open(links.wikipediaURL)
    }
    
    @objc
    func handleYoutube() {
        guard let links = links else { fatalError("This really did not work as expected") }
        UIApplication.shared.open(links.youtubeURL)
    }
    
}

