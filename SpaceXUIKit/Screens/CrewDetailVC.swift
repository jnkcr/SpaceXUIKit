//
//  CrewDetailVC.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 17.02.2022.
//

import UIKit

final class CrewDetailVC: UIViewController {
    
    let wikiURL: URL
    
    let scrollView: UIScrollView = {
        let sv: UIScrollView = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.alwaysBounceVertical = true
        sv.showsVerticalScrollIndicator = false
        return sv
    }()
    let infoStack: CrewDetailStack

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .systemBackground
        title = "Detail"
        // Subviews
        view.addSubview(scrollView)
        scrollView.addSubview(infoStack)
        // UI Config
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.readableContentGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.readableContentGuide.bottomAnchor),
            scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: infoStack.topAnchor),
            scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: infoStack.leadingAnchor),
            scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: infoStack.trailingAnchor),
            scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: infoStack.bottomAnchor),
        ])
    }
    
    init(viewModel: CrewDetailVM) {
        wikiURL = viewModel.wikiURL
        infoStack = CrewDetailStack(vm: viewModel)
        super.init(nibName: nil, bundle: nil)
        infoStack.wikiButton.addTarget(self, action: #selector(handleWikiButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CrewDetailVC {
    
    @objc
    func handleWikiButton() {
        UIApplication.shared.open(wikiURL)
    }
    
}
