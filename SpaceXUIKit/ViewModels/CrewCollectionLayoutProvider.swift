//
//  CrewCollectionLayoutProvider.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 16.02.2022.
//

import UIKit

final class CrewCollectionLayoutProvider {
    
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
    
    let sectionHeaders: [NSCollectionLayoutBoundarySupplementaryItem] = {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(30))
        var headers: [NSCollectionLayoutBoundarySupplementaryItem] = []
        for section in Section.allCases {
            headers.append(NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: section.rawValue, alignment: .top))
        }
        return headers
    }()
    
    lazy var collectionLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let numOfColumns: Int = {
                switch sectionIndex {
                case 0:
                    return 3
                case 3:
                    return 1
                default:
                    return 2
                }
            }()
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(1))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                              subitem: item,
                                                                count: numOfColumns)
            
            group.interItemSpacing = .fixed(ConstraintsHelper.padding)
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = ConstraintsHelper.padding
            section.boundarySupplementaryItems = [self.sectionHeaders[sectionIndex]]
            section.contentInsets = NSDirectionalEdgeInsets(top: ConstraintsHelper.padding, leading: 0, bottom: ConstraintsHelper.padding * 3, trailing: 0)
            
            return section
        }
        return layout
    }()
    
}
