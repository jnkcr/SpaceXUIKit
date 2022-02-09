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
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = ConstraintsHelper.largeSpacing
        return stack
    }()
    private lazy var headerView: DetailHeaderView = {
        DetailHeaderView(name: flightDetailVM!.name, description: flightDetailVM!.description)
    }()
    private lazy var highlightsView: DetailHighlightsView = {
        DetailHighlightsView(dateDesc: flightDetailVM!.dateDescription, crewDesc: flightDetailVM!.crewMembersDescription, successDesc: flightDetailVM!.successDescription, successImg: flightDetailVM!.successImage)
    }()
    private lazy var linksStack: DetailLinksStack = {
        DetailLinksStack(links: flightDetailVM!.buttonLinks)
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
        stackView.addArrangedSubview(linksStack)
        
        NSLayoutConstraint.activate([
            // SCROLLVIEW
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: ConstraintsHelper.padding),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -ConstraintsHelper.padding),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: stackView.topAnchor),
            scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            // STACK
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ConstraintsHelper.padding),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -ConstraintsHelper.padding),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
}
