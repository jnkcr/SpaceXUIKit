//
//  SpaceFlightsImagesVC.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 25.02.2022.
//

import UIKit

class SpaceFlightsImagesVC: UIViewController {
    
    let images: [UIImage?]
    let tableView: UITableView = {
        let tv: UITableView = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .systemBackground
        tv.separatorStyle = .none
        tv.showsVerticalScrollIndicator = false
        tv.estimatedRowHeight = 150
        tv.register(FlightImagesCell.self, forCellReuseIdentifier: FlightImagesCell.reuseID)
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .systemBackground
        title = "Flight images"
        // Table view delegates
        tableView.dataSource = self
        tableView.delegate = self
        // Subviews
        view.addSubview(tableView)
        // UI Config
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.readableContentGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.readableContentGuide.bottomAnchor),
        ])
    }
    
    init(imgs: [UIImage?]) {
        images = imgs
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Table view

extension SpaceFlightsImagesVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FlightImagesCell.reuseID, for: indexPath) as? FlightImagesCell else { fatalError("Flight images: Reusable cell has to be created") }
        cell.flightImageView.image = images[indexPath.row]
        return cell
    }
    
}
