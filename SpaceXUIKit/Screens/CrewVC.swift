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
    let collectionLayout: UICollectionViewLayout = {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.25))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        group.interItemSpacing = .fixed(ConstraintsHelper.padding)
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }()
    lazy var collectionView: UICollectionView = {
        let collection: UICollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CrewCell.self, forCellWithReuseIdentifier: CrewCell.reusableID)
        collection.showsVerticalScrollIndicator = false
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Crew"
        // Download
        handleCrewDownload()
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}

extension CrewVC {
    
    func handleCrewDownload() {
        let downloader = CrewDownloader()
        Task {
            let data = try await downloader.downloadAllCrewMembers()
            var crewData: [CrewCellData] = []
            for dt in data {
                crewData.append(CrewCellData(id: dt.id, image: UIImage(named: "clever")!, name: dt.name))
            }
            updateDataSource(with: crewData)
        }
    }
    
    func updateDataSource(with data: [CrewCellData]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, CrewCellData>()
        snapshot.appendSections([.main])
        snapshot.appendItems(data)
        DispatchQueue.main.async { self.collectionDataSource.apply(snapshot, animatingDifferences: true) }
    }
    
}
