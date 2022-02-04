//
//  SpaceFlightsVC.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 04.02.2022.
//

import UIKit

class SpaceFlightsVC: UIViewController {
    
    let dummyData: [String] = ["Karel", "Evžen", "Roman", "Libor", "Karel 1", "Evžen 1", "Roman 1", "Libor 1", "Karel 2", "Evžen 2", "Roman 2", "Libor 2", "Karel 3", "Evžen 3", "Roman 3", "Libor 3", "Karel 4", "Evžen 4", "Roman 4", "Libor 4"]
    
    let tableView: UITableView = UITableView(frame: .zero, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Flights"
        view.backgroundColor = .systemBackground
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureTableView()
    }
    
}

extension SpaceFlightsVC: UITableViewDataSource, UITableViewDelegate {
    
    // Number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dummyData.count
    }
    
    // Cell creation and setup
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FlightCell.reusableID, for: indexPath) as! FlightCell
        cell.flightLabel.text = dummyData[indexPath.row]
        return cell
    }
    
}

extension SpaceFlightsVC {
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.rowHeight = 60
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FlightCell.self, forCellReuseIdentifier: FlightCell.reusableID)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
}
