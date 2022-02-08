//
//  SpaceFlightsVC.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 04.02.2022.
//

import UIKit

class SpaceFlightsVC: UIViewController {
    
    let tableView: UITableView = UITableView(frame: .zero, style: .plain)
    
    let spaceFlightsViewModel = SpaceFlightsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Flights"
        view.backgroundColor = .systemBackground
        // Configure UI
        addSubviews()
        configureTableView()
        addConstraints()
        configurePullToRefresh()
        // Download flights
        spaceFlightsViewModel.loadingDelegate = self
        spaceFlightsViewModel.loadFlights()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        // Deselect row after navigationg back from detail view
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
    }
    
}

#warning("Pull to refresh: mby incomplete implementation")
extension SpaceFlightsVC {
    
    private func configurePullToRefresh() {
        let refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        tableView.refreshControl?.addTarget(self, action: #selector(refreshTableData), for: .valueChanged)
    }
    
    @objc
    private func refreshTableData() {
        spaceFlightsViewModel.loadFlights()
        DispatchQueue.main.async { self.tableView.refreshControl?.endRefreshing() }
    }
 
}

extension SpaceFlightsVC: FlightsDownloadingDelegate {
    
    func didFinishLoading(with result: Result<Void, FlightError>) {
        switch result {
        case .success():
            DispatchQueue.main.async { self.tableView.reloadData() }
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
}

// MARK: - Table functions

extension SpaceFlightsVC: UITableViewDataSource {
    
    // Number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        spaceFlightsViewModel.flights?.count ?? 0
    }
    
    // Cell creation and setup
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FlightCell.reusableID, for: indexPath) as? FlightCell else { fatalError("Cannot downcast to FlightCell") }
        cell.flightData = spaceFlightsViewModel.flights?[indexPath.row]
        return cell
    }
    
}

extension SpaceFlightsVC: UITableViewDelegate {
    
    // Navigate to detail screen by selecting table row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let spaceFlightDetailVC = SpaceFlightDetailVC()
        guard let flight = spaceFlightsViewModel.flights?[indexPath.row] else { fatalError("There has to be a flight with given index path") }
        spaceFlightDetailVC.flightDetailVM = FlightDetailVM(flight: flight)
        navigationController?.pushViewController(spaceFlightDetailVC, animated: true)
    }
    
}

// MARK: - UI Configuration

extension SpaceFlightsVC {
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func configureTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.rowHeight = 70
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FlightCell.self, forCellReuseIdentifier: FlightCell.reusableID)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
}
