//
//  DetailHighlightsView.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 08.02.2022.
//

import UIKit

class DetailHighlightsView: UIStackView {
    
    private let dateIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "calendar.circle")
        imageView.tintColor = .secondaryLabel
        return imageView
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textAlignment = .center
        return label
    }()
    
    private let crewIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person.2.circle")
        imageView.tintColor = .secondaryLabel
        return imageView
    }()
    
    let crewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var dateStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 5
        return stack
    }()
    
    private lazy var crewStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 5
        return stack
    }()
    
    private lazy var highlightStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 0
        return stack
    }()
    
    init(dateDesc: String, crewDesc: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        // Labels text
        dateLabel.text = dateDesc
        crewLabel.text = crewDesc
        // Add subviews
        addSubview(highlightStack)
        highlightStack.addArrangedSubview(dateStack)
        highlightStack.addArrangedSubview(crewStack)
        dateStack.addArrangedSubview(dateIcon)
        dateStack.addArrangedSubview(dateLabel)
        crewStack.addArrangedSubview(crewIcon)
        crewStack.addArrangedSubview(crewLabel)
        
        let stackWidth: CGFloat = (UIScreen.main.bounds.width - (2 * ConstraintsHelper.padding)) / 2
        let imageSize: CGFloat = 50
        
        NSLayoutConstraint.activate([
            // DATE
            dateIcon.widthAnchor.constraint(equalToConstant: imageSize),
            dateIcon.heightAnchor.constraint(equalToConstant: imageSize),
            dateLabel.leadingAnchor.constraint(equalTo: dateStack.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: dateStack.trailingAnchor),
            dateStack.topAnchor.constraint(equalTo: highlightStack.topAnchor),
            dateStack.leadingAnchor.constraint(equalTo: highlightStack.leadingAnchor),
            dateStack.bottomAnchor.constraint(equalTo: highlightStack.bottomAnchor),
            dateStack.widthAnchor.constraint(equalToConstant: stackWidth),
            // CREW
            crewIcon.widthAnchor.constraint(equalToConstant: imageSize),
            crewIcon.heightAnchor.constraint(equalToConstant: imageSize),
            crewLabel.leadingAnchor.constraint(equalTo: crewStack.leadingAnchor),
            crewLabel.trailingAnchor.constraint(equalTo: crewStack.trailingAnchor),
            crewStack.topAnchor.constraint(equalTo: highlightStack.topAnchor),
            crewStack.trailingAnchor.constraint(equalTo: highlightStack.trailingAnchor),
            crewStack.bottomAnchor.constraint(equalTo: highlightStack.bottomAnchor),
            crewStack.widthAnchor.constraint(equalToConstant: stackWidth),
            // HIGHLIGHT stack
            highlightStack.topAnchor.constraint(equalTo: self.topAnchor),
            highlightStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            highlightStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            highlightStack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
