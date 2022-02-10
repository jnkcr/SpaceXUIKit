//
//  LoadingIndicatorView.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 09.02.2022.
//

import UIKit

class LoadingIndicatorView: UIView {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .systemYellow
        imageView.image = UIImage(systemName: "arrow.down.to.line")
        return imageView
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
        addSubview(imageView)
        addSubview(progressBar)
        NSLayoutConstraint.activate([
            // IMAGE
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -40),
            imageView.widthAnchor.constraint(equalToConstant: 68),
            imageView.heightAnchor.constraint(equalToConstant: 85),
            // PROGRESS
            progressBar.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: ConstraintsHelper.mediumSpacing),
            progressBar.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            progressBar.widthAnchor.constraint(equalToConstant: 200),
        ])
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
