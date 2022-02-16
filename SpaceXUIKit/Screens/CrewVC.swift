//
//  CrewVC.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 04.02.2022.
//

import UIKit

class CrewVC: UIViewController {
    
    let crewVM: CrewVM = CrewVM()
    let crewLayoutProvider: CrewCollectionLayoutProvider = CrewCollectionLayoutProvider()
    
    let headerRegistrations: [String: UICollectionView.SupplementaryRegistration<CrewHeader>] = {
        var registrations: [String: UICollectionView.SupplementaryRegistration<CrewHeader>] = [:]
        for section in Section.allCases {
            let registration = UICollectionView.SupplementaryRegistration<CrewHeader>(elementKind: section.rawValue) { supplementaryView, elementKind, indexPath in
                supplementaryView.headerLabel.text = elementKind
            }
            registrations[section.rawValue] = registration
        }
        return registrations
    }()
    lazy var collectionDataSource: UICollectionViewDiffableDataSource<Section, CrewCellData> = {
        let dataSource = UICollectionViewDiffableDataSource<Section, CrewCellData>(collectionView: collectionView) { (colView, index, crewData) -> UICollectionViewCell? in
            guard let cell = colView.dequeueReusableCell(withReuseIdentifier: CrewCell.reusableID, for: index) as? CrewCell else { fatalError("Collection cell must be downcasted right") }
            cell.photoView.image = crewData.image
            cell.nameLabel.text = crewData.name
            return cell
        }
        dataSource.supplementaryViewProvider = { [self] (view, kind, indexPath) in
            switch kind {
            case "NASA":
                guard let registration = headerRegistrations["NASA"] else { fatalError("There has to be matching kind of type \(kind)") }
                return collectionView.dequeueConfiguredReusableSupplementary(using: registration, for: indexPath)
            case "SpaceX":
                guard let registration = headerRegistrations["SpaceX"] else { fatalError("There has to be matching kind of type \(kind)") }
                return collectionView.dequeueConfiguredReusableSupplementary(using: registration, for: indexPath)
            case "ESA":
                guard let registration = headerRegistrations["ESA"] else { fatalError("There has to be matching kind of type \(kind)") }
                return collectionView.dequeueConfiguredReusableSupplementary(using: registration, for: indexPath)
            case "JAXA":
                guard let registration = headerRegistrations["JAXA"] else { fatalError("There has to be matching kind of type \(kind)") }
                return collectionView.dequeueConfiguredReusableSupplementary(using: registration, for: indexPath)
            case "Axiom Space":
                guard let registration = headerRegistrations["Axiom Space"] else { fatalError("There has to be matching kind of type \(kind)") }
                return collectionView.dequeueConfiguredReusableSupplementary(using: registration, for: indexPath)
            default:
                fatalError("Crew collection view: element kind has to match")
            }
        }
        return dataSource
    }()
    lazy var collectionView: UICollectionView = {
        let collection: UICollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: crewLayoutProvider.collectionLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CrewCell.self, forCellWithReuseIdentifier: CrewCell.reusableID)
        collection.register(CrewHeader.self, forSupplementaryViewOfKind: "header", withReuseIdentifier: CrewHeader.reuseID)
        collection.showsVerticalScrollIndicator = false
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        title = "Crew"
        // Download data
        crewVM.downloadingDelegate = self
        crewVM.downloadCrew()
        // Subviews
        view.addSubview(collectionView)
        // UIConfiguration
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
}

extension CrewVC: CrewDownloadingDelegate {
    
    func didFinishDownloading(with result: Result<NSDiffableDataSourceSnapshot<Section, CrewCellData>, DownloadError>) {
        switch result {
        case .success(let snapshot):
            DispatchQueue.main.async { self.collectionDataSource.apply(snapshot) }
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
}
