//
//  AlertVC.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 18.02.2022.
//

import UIKit
import Lottie

class AlertVC: UIViewController {
    
    let conteinerView: UIView = {
        let conteiner: UIView = UIView()
        conteiner.translatesAutoresizingMaskIntoConstraints = false
        conteiner.backgroundColor = .systemBackground
        conteiner.layer.borderWidth = 2
        conteiner.layer.borderColor = UIColor.systemYellow.cgColor
        conteiner.layer.cornerRadius = 10
        return conteiner
    }()
    let titleLabel: SectionTitleLabel = SectionTitleLabel(titled: "Error", sized: 36)
    let descriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
    let confirmationButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.tintColor = .systemYellow
        button.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "alertColor")
        // Subviews
        conteinerView.addSubview(titleLabel)
        conteinerView.addSubview(descriptionLabel)
        conteinerView.addSubview(confirmationButton)
        view.addSubview(conteinerView)
        // UI Config
        NSLayoutConstraint.activate([
            // CONTAINER
            conteinerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            conteinerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            conteinerView.widthAnchor.constraint(equalToConstant: 280),
            conteinerView.heightAnchor.constraint(equalToConstant: 220),
            // TITLE
            titleLabel.topAnchor.constraint(equalTo: conteinerView.topAnchor, constant: ConstraintsHelper.padding),
            titleLabel.centerXAnchor.constraint(equalTo: conteinerView.centerXAnchor),
            // DESCRIPTION
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: ConstraintsHelper.padding),
            descriptionLabel.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: ConstraintsHelper.padding),
            descriptionLabel.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -ConstraintsHelper.padding),
            // BUTTON
            confirmationButton.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: ConstraintsHelper.padding),
            confirmationButton.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -ConstraintsHelper.padding),
            confirmationButton.bottomAnchor.constraint(equalTo: conteinerView.bottomAnchor, constant: -ConstraintsHelper.padding),
            confirmationButton.heightAnchor.constraint(equalToConstant: 44),
            
        ])
    }
    
    init(titleText: String, description: String, buttonConfirmationText: String) {
        super.init(nibName: nil, bundle: nil)
        titleLabel.text = titleText
        descriptionLabel.text = description
        confirmationButton.setTitle(buttonConfirmationText, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AlertVC {
    
    @objc
    func dismissVC() {
        self.dismiss(animated: true)
    }
    
}
