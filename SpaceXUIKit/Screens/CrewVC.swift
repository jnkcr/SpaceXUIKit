//
//  CrewVC.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 04.02.2022.
//

import UIKit

class CrewVC: UIViewController {
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("open link", for: .normal)
        button.configuration = .filled()
        button.configuration?.cornerStyle = .large
        button.configuration?.buttonSize = .large
        button.tintColor = .systemYellow
        button.addTarget(self, action: #selector(openLink), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Crew"
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            button.widthAnchor.constraint(equalToConstant: 100),
//            button.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}

extension CrewVC {
    
    @objc
    func openLink() {
        let url = URL(string: "http://www.spacex.com/news/2013/02/11/falcon-1-flight-3-mission-summary")!
        UIApplication.shared.open(url)
    }
    
}
