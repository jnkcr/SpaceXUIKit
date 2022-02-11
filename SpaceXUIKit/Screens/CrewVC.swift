//
//  CrewVC.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 04.02.2022.
//

import UIKit

class CrewVC: UIViewController {
    
    let crewVM: CrewVM = CrewVM()
    
    enum Section {
        case main
    }
    
    lazy var collectionDataSource: UICollectionViewDiffableDataSource<Section, CrewCellData> = {
        let dataSource = UICollectionViewDiffableDataSource<Section, CrewCellData>(collectionView: collectionView) { (colView, index, crewData) -> UICollectionViewCell? in
            guard let cell = colView.dequeueReusableCell(withReuseIdentifier: CrewCell.reusableID, for: index) as? CrewCell else { fatalError("Collection cell must be downcasted right") }
            cell.photoView.image = crewData.image
            cell.nameLabel.text = crewData.name
            return cell
        }
        return dataSource
    }()
    let layout: UICollectionViewCompositionalLayout = {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }()
    lazy var collectionView: UICollectionView = {
        let collection: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CrewCell.self, forCellWithReuseIdentifier: CrewCell.reusableID)
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = .systemIndigo
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Crew"
        // Subviews
        view.addSubview(collectionView)
        // UIConfiguration
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}

extension CrewVC {
    
    @objc
    func handleCrewDownload() {
        let downloader = CrewDownloader()
        Task {
            try? await downloader.downloadAllCrewMembers()
        }
    }
    
}
