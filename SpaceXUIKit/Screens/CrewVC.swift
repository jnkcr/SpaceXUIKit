//
//  CrewVC.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 04.02.2022.
//

import UIKit

class CrewVC: UIViewController {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "clever")
        return imageView
    }()
    let downloadButton: LargeTintedButton = {
        let button: LargeTintedButton = LargeTintedButton(text: "Download")
        button.addTarget(self, action: #selector(handleCrewDownload), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Crew"
        // Subviews
        view.addSubview(imageView)
        view.addSubview(downloadButton)
        // UIConfiguration
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 250),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            
            downloadButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: ConstraintsHelper.mediumSpacing),
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}

extension CrewVC {
    
    @objc
    func handleCrewDownload() {
        let downloader = CrewDownloader()
        Task {
            try? await downloader.downloadAllCrewMembers()
        }
    }
    
}
