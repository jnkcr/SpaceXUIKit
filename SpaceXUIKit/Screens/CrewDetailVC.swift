//
//  CrewDetailVC.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 17.02.2022.
//

import UIKit

class CrewDetailVC: UIViewController {
    
    let crewDetailVM: CrewDetailVM
    
    lazy var nameLabel: SectionTitleLabel = {
        SectionTitleLabel(titled: crewDetailVM.nameDescription)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .systemBackground
        title = "Detail"
        // Subviews
        view.addSubview(nameLabel)
        // UI Config
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    init(viewModel: CrewDetailVM) {
        crewDetailVM = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
