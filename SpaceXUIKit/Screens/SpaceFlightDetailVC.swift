//
//  SpaceFlightDetailVC.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 04.02.2022.
//

import UIKit

final class SpaceFlightDetailVC: UIViewController {
    
    var flightDetailVM: FlightDetailVM
    
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
    private lazy var headerView: DetailHeaderView = DetailHeaderView(name: flightDetailVM.name, description: flightDetailVM.description)
    private lazy var highlightsView: DetailHighlightsView = DetailHighlightsView(dateDesc: flightDetailVM.dateDescription, crewDesc: flightDetailVM.crewMembersDescription, successDesc: flightDetailVM.successDescription, successImg: flightDetailVM.successImage)
    private lazy var imagesSegueButton = ImagesSegueButtonStack()
    private lazy var linksStack: DetailLinksStack = DetailLinksStack(links: flightDetailVM.buttonLinks)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .systemBackground
        title = "Detail"
        // Download images
        flightDetailVM.flightImagesDelegate = self
        flightDetailVM.downloadImages()
        // Subviews
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(headerView)
        stackView.addArrangedSubview(highlightsView)
        stackView.addArrangedSubview(imagesSegueButton)
        stackView.addArrangedSubview(linksStack)
        // UI Constraints
        NSLayoutConstraint.activate([
            // SCROLLVIEW
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: stackView.topAnchor),
            scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            // STACK
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ConstraintsHelper.padding),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -ConstraintsHelper.padding),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            imagesSegueButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            imagesSegueButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadInputViews()
    }
    
    init(viewModel: FlightDetailVM) {
        flightDetailVM = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SpaceFlightDetailVC: FlightImagesDelegate {
    
    func didFinishDownloadingImages() {
        //
    }
    
}
