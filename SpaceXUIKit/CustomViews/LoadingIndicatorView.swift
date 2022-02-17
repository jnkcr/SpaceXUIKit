//
//  LoadingIndicatorView.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 09.02.2022.
//

import UIKit
import Lottie

class LoadingIndicatorView: UIStackView {
    
    private let animationView: AnimationView
    let percentageLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.text = "0 %"
        return label
    }()
    let progressBar: UIProgressView = {
        let bar = UIProgressView()
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.progressViewStyle = .default
        bar.progress = 0.0
        return bar
    }()
    
    init(animationName: String = "rocket01") {
        // Animation setup
        animationView = AnimationView(name: animationName)
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        // View setup
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        alignment = .center
        spacing = ConstraintsHelper.mediumSpacing
        // Subviews
        addArrangedSubview(animationView)
        addArrangedSubview(percentageLabel)
        addArrangedSubview(progressBar)
        // UI Constraints
        NSLayoutConstraint.activate([
            // ANIMATION
            animationView.widthAnchor.constraint(equalToConstant: 150),
            // LABEL
            percentageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            percentageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            // PROGRESS
            progressBar.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
