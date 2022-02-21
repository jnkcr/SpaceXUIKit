//
//  CrewDetailVC.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 17.02.2022.
//

import UIKit

class CrewDetailVC: UIViewController {
    
    let crewDetailVM: CrewDetailVM
    
    let scrollView: UIScrollView = {
        let sv: UIScrollView = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.alwaysBounceVertical = true
        sv.showsVerticalScrollIndicator = false
        return sv
    }()
    let imageView: UIImageView = {
        let iv: UIImageView = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 10
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    lazy var infoStack: CrewInfoStack = CrewInfoStack(vm: crewDetailVM)

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .systemBackground
        title = "Detail"
        // Subviews
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(infoStack)
        // UI Config
        NSLayoutConstraint.activate([
            // SCROLLVIEW
            scrollView.topAnchor.constraint(equalTo: view.readableContentGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.readableContentGuide.bottomAnchor),
            scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: imageView.topAnchor),
            scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: infoStack.leadingAnchor),
            scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: infoStack.trailingAnchor),
            scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: infoStack.bottomAnchor),
            // IMAGE
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: ConstraintsHelper.padding),
            imageView.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            // NAME
            infoStack.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: ConstraintsHelper.largeSpacing),
            infoStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: ConstraintsHelper.padding),
            infoStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -ConstraintsHelper.padding),
            infoStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -ConstraintsHelper.padding)
        ])
    }
    
    init(viewModel: CrewDetailVM) {
        crewDetailVM = viewModel
        super.init(nibName: nil, bundle: nil)
        imageView.image = crewDetailVM.memberPhoto
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
