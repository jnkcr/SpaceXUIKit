//
//  SpaceFlightDetailVC.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 04.02.2022.
//

import UIKit

class SpaceFlightDetailVC: UIViewController {
    
    var flightDetailVM: FlightDetailVM?
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 30
        return stack
    }()
    private lazy var headerView: DetailHeaderView = {
        DetailHeaderView(name: flightDetailVM!.name, description: flightDetailVM!.description)
    }()
    private lazy var highlightsView: DetailHighlightsView = {
        DetailHighlightsView(dateDesc: flightDetailVM!.dateDescription, crewDesc: flightDetailVM!.crewMembersDescription)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Detail"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(headerView)
        stackView.addArrangedSubview(highlightsView)
        
        NSLayoutConstraint.activate([
            // SCROLLVIEW
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: ConstraintsHelper.padding),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -ConstraintsHelper.padding),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.contentLayoutGuide.widthAnchor.constraint(equalTo: view.widthAnchor), // Stops horizontal scrolling
            // HEADER
//            headerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ConstraintsHelper.padding),
//            headerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: ConstraintsHelper.padding),
//            headerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -ConstraintsHelper.padding),
//            headerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 70),
            // HIGHLIGHTS
//            highlightsView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: ConstraintsHelper.padding),
//            highlightsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: ConstraintsHelper.padding),
//            highlightsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -ConstraintsHelper.padding),
//            highlightsView.heightAnchor.constraint(equalToConstant: 100)
            // STACK
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
//            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        ])
    }
    
}
