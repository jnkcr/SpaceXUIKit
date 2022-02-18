//
//  CrewDetailVC.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 17.02.2022.
//

import UIKit

class CrewDetailVC: UIViewController {
    
    let crewDetailVM: CrewDetailVM
    
    let imageView: UIImageView = {
        let iv: UIImageView = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 10
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    lazy var nameLabel: SectionTitleLabel = {
        SectionTitleLabel(titled: crewDetailVM.nameDescription)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .systemBackground
        title = "Detail"
        // Subviews
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        // UI Config
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: ConstraintsHelper.padding),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    init(viewModel: CrewDetailVM) {
        crewDetailVM = viewModel
        super.init(nibName: nil, bundle: nil)
        imageView.image = crewDetailVM.memberPhoto
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
