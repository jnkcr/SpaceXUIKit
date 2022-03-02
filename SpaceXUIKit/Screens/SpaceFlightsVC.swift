//
//  SpaceFlightsVC.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 04.02.2022.
//

import UIKit

final class SpaceFlightsVC: UIViewController {
    
    let spaceFlightsVM: SpaceFlightsVM
    
    private var loadingIndicatorView: LoadingIndicatorView?
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemBackground
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.register(FlightCell.self, forCellReuseIdentifier: FlightCell.reusableID)
        table.estimatedRowHeight = 70
        return table
    }()
    private lazy var refreshBarButton: UIBarButtonItem = {
        UIBarButtonItem(image: UIImage(systemName: "arrow.triangle.2.circlepath"), style: .plain, target: self, action: #selector(redownloadAndRefreshTableData))
    }()
    private lazy var alertBarButton: UIBarButtonItem = {
        UIBarButtonItem(image: UIImage(systemName: "multiply.circle"), style: .plain, target: self, action: #selector(showAlert))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Flights"
        view.backgroundColor = .systemBackground
        navigationItem.leftBarButtonItem = refreshBarButton
        navigationItem.rightBarButtonItem = alertBarButton
        // Loading indicator view
        let loadingIndicatorView: LoadingIndicatorView = LoadingIndicatorView(animationName: AnimationShuffler.getAnimationName(for: .rocket))
        // Table delegates
        tableView.dataSource = self
        tableView.delegate = self
        // UI Configuration
        view.addSubview(loadingIndicatorView)
        NSLayoutConstraint.activate([
            loadingIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        // Download data
        spaceFlightsVM.loadingDelegate = self
        spaceFlightsVM.loadFlights()
        self.loadingIndicatorView = loadingIndicatorView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Deselect row after navigationg back from detail view
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
    }
    
    init(viewModel: SpaceFlightsVM = SpaceFlightsVM()) {
        spaceFlightsVM = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Additional functionality

extension SpaceFlightsVC {
    
    private func activateTableView() {
        DispatchQueue.main.async { [self] in
            loadingIndicatorView?.removeFromSuperview()
            loadingIndicatorView = nil
            view.addSubview(tableView)
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            ])
            configurePullToRefresh()
        }
    }
    
    private func configurePullToRefresh() {
        let refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        tableView.refreshControl?.addTarget(self, action: #selector(redownloadAndRefreshTableData), for: .valueChanged)
    }
    
    @objc
    private func redownloadAndRefreshTableData() {
        spaceFlightsVM.loadFlights()
        DispatchQueue.main.async { self.tableView.refreshControl?.endRefreshing() }
    }
    
    @objc
    private func showAlert() {
        shownCustomAlert(title: "Error", description: "Upsssss!!! But do not worry. This is just a showcase error.", confirmationText: "Ok")
    }
 
}

extension SpaceFlightsVC: FlightsDownloadingDelegate {
    
    func didChangeProgress(to value: Float) {
        DispatchQueue.main.async { [self] in
            let percentage = Int(value * 100)
            loadingIndicatorView?.percentageLabel.text = "\(percentage) %"
            loadingIndicatorView?.progressBar.setProgress(value, animated: true)
        }
    }
    
    func didFinishLoading(with result: Result<Void, DownloadError>) {
        switch result {
        case .success():
            activateTableView()
            DispatchQueue.main.async { self.tableView.reloadData() }
        case .failure(let error):
            shownCustomAlert(description: error.rawValue)
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
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
}

extension SpaceFlightsVC: UITableViewDelegate {
    
    // Navigate to detail screen by selecting table row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = FlightDetailVM(flight: spaceFlightsVM.flights[indexPath.row])
        let spaceFlightDetailVC = SpaceFlightDetailVC(viewModel: viewModel)
        navigationController?.pushViewController(spaceFlightDetailVC, animated: true)
    }
    
}
