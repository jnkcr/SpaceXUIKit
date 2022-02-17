//
//  LoadingIndicatorView.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 09.02.2022.
//

import UIKit
import Lottie

class LoadingIndicatorView: UIStackView {
    
    private let animationView: AnimationView = {
        let animation: AnimationView = AnimationView(name: "rocket01")
        animation.loopMode = .loop
        animation.contentMode = .scaleAspectFit
        return animation
    }()
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
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        alignment = .center
        spacing = ConstraintsHelper.mediumSpacing
        // Animation
        animationView.play()
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

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
