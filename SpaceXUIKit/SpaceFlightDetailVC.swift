//
//  SpaceFlightDetailVC.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 04.02.2022.
//

import UIKit

class SpaceFlightDetailVC: UIViewController {
    
    var flightName: String!
    
    let nameLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Flight detail"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        addSubviews()
        configureLabel()
        addConstraints()
    }
    
}

extension SpaceFlightDetailVC {
    
    private func addSubviews() {
        view.addSubview(nameLabel)
    }
    
    private func configureLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = flightName
        nameLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
}
