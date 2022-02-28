//
//  CrewVC.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 04.02.2022.
//

import UIKit

final class CrewVC: UIViewController {
    
    let crewVM: CrewVM
    let crewLayoutProvider: CrewCollectionLayoutProvider = CrewCollectionLayoutProvider()
    private var loadingIndicatorView: LoadingIndicatorView?
    
    lazy var collectionDataSource: UICollectionViewDiffableDataSource<Section, CrewCellData> = {
        let dataSource = UICollectionViewDiffableDataSource<Section, CrewCellData>(collectionView: collectionView) { (colView, index, crewData) -> UICollectionViewCell? in
            guard let cell = colView.dequeueReusableCell(withReuseIdentifier: CrewCell.reusableID, for: index) as? CrewCell else { fatalError("Collection cell must be downcasted right") }
            cell.photoView.image = crewData.image
            cell.nameLabel.text = crewData.name
            return cell
        }
        dataSource.supplementaryViewProvider = { [self] (view, kind, indexPath) in
            guard let registration = crewLayoutProvider.headerRegistrations[Section[indexPath.section]] else { fatalError("There has to be matching kind of type \(kind)") }
            return collectionView.dequeueConfiguredReusableSupplementary(using: registration, for: indexPath)
        }
        return dataSource
    }()
    lazy var collectionView: UICollectionView = {
        let collection: UICollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: crewLayoutProvider.collectionLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CrewCell.self, forCellWithReuseIdentifier: CrewCell.reusableID)
        collection.register(CrewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CrewHeader.reuseID)
        collection.showsVerticalScrollIndicator = false
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        title = "Crew"
        // Collection delegate
        collectionView.delegate = self
        // Download data
        crewVM.downloadingDelegate = self
        crewVM.downloadCrew()
        // Subviews
        let loadingIndicatorView = LoadingIndicatorView(animationName: AnimationShuffler.getAnimationName(for: .astronaut))
        view.addSubview(loadingIndicatorView)
        // UI Config
        NSLayoutConstraint.activate([
            loadingIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        self.loadingIndicatorView = loadingIndicatorView
    }
    
    init(viewModel: CrewVM = CrewVM()) {
        crewVM = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Functionality extension

extension CrewVC {
    
    private func activateCollectionView() {
        DispatchQueue.main.async { [self] in
            loadingIndicatorView?.removeFromSuperview()
            loadingIndicatorView = nil
            view.addSubview(collectionView)
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: view.topAnchor),
                collectionView.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
        }
    }
    
}

// MARK: - Downloading delegation

extension CrewVC: CrewDownloadingDelegate {
    
    func didFinishDownloading(with result: Result<NSDiffableDataSourceSnapshot<Section, CrewCellData>, DownloadError>) {
        switch result {
        case .success(let snapshot):
            DispatchQueue.main.async { [self] in
                collectionDataSource.apply(snapshot)
                activateCollectionView()
            }
        case .failure(let error):
            self.shownCustomAlert(description: error.rawValue)
        }
    }
    
    func didChangeProgress(to value: Float) {
        DispatchQueue.main.async { [self] in
            let percentage = Int(value * 100)
            loadingIndicatorView?.percentageLabel.text = "\(percentage) %"
            loadingIndicatorView?.progressBar.setProgress(value, animated: true)
        }
    }
    
}

// MARK: - CollectionView delegation

extension CrewVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Get corresponding item
        guard let cellItem = collectionDataSource.itemIdentifier(for: indexPath) else { fatalError("There has to be cell item present") }
        guard let item = crewVM.crew.filter({ $0.crewMember.id.contains(cellItem.id) }).first else { fatalError("There has to be item findable by id") }
        // Navigate to detail view controller
        let viewModel = CrewDetailVM(crewMember: item)
        let vc = CrewDetailVC(viewModel: viewModel)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
