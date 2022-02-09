//
//  SpaceFlightsVC.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 04.02.2022.
//

import UIKit

class SpaceFlightsVC: UIViewController {
    
    let spaceFlightsVM = SpaceFlightsViewModel()
    
    private let loadingIndicatorView: UIView = {
        LoadingIndicatorView()
    }()
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemBackground
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.rowHeight = 70
        return table
    }()
    lazy var loadingIndicatorConstraints: [NSLayoutConstraint] = {
        [
            loadingIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ]
    }()
    lazy var tableViewConstraints: [NSLayoutConstraint] = {
        [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: ConstraintsHelper.padding),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -ConstraintsHelper.padding)
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Flights"
        view.backgroundColor = .systemBackground
        // Table
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FlightCell.self, forCellReuseIdentifier: FlightCell.reusableID)
        // Configuration
        view.addSubview(loadingIndicatorView)
        NSLayoutConstraint.activate(loadingIndicatorConstraints)
        // Download data
        spaceFlightsVM.loadingDelegate = self
        spaceFlightsVM.loadFlights()
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

// MARK: - Additional functionality

extension SpaceFlightsVC {
    
    private func activateTableView() {
        DispatchQueue.main.async { [self] in
            loadingIndicatorView.removeFromSuperview()
            view.addSubview(tableView)
            NSLayoutConstraint.activate(tableViewConstraints)
            configurePullToRefresh()
        }
    }
    
    private func configurePullToRefresh() {
        let refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        tableView.refreshControl?.addTarget(self, action: #selector(refreshTableData), for: .valueChanged)
    }
    
    @objc
    private func refreshTableData() {
        spaceFlightsVM.loadFlights()
        DispatchQueue.main.async { self.tableView.refreshControl?.endRefreshing() }
    }
 
}

extension SpaceFlightsVC: FlightsDownloadingDelegate {
    
    func didFinishLoading(with result: Result<Void, FlightError>) {
        switch result {
        case .success():
            activateTableView()
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
        spaceFlightsVM.flights.count
    }
    
    // Cell creation and setup
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FlightCell.reusableID, for: indexPath) as? FlightCell else { fatalError("Cannot downcast to FlightCell") }
        cell.flightData = spaceFlightsVM.generateCellData(for: indexPath.row)
        return cell
    }
    
}

extension SpaceFlightsVC: UITableViewDelegate {
    
    // Navigate to detail screen by selecting table row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let spaceFlightDetailVC = SpaceFlightDetailVC()
        spaceFlightDetailVC.flightDetailVM = FlightDetailVM(flight: spaceFlightsVM.flights[indexPath.row])
        navigationController?.pushViewController(spaceFlightDetailVC, animated: true)
    }
    
}
