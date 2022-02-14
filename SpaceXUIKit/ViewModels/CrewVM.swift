//
//  CrewVM.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 11.02.2022.
//

import UIKit

protocol CrewDownloadingDelegate {
    func didFinishDownloading(with result: Result<NSDiffableDataSourceSnapshot<Section, CrewCellData>, DownloadError>)
}

final class CrewVM {
    
    private let networkManager: CrewAndImagesDownloadable
    var downloadingDelegate: CrewDownloadingDelegate?
    
    var crew: [CrewMemberAndPhoto] = []
    
    init(networkManager: CrewAndImagesDownloadable = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func downloadCrew() {
        Task {
            do {
                let crewData: [CrewMember] = try await networkManager.downloadAllCrewMembers()
                var crewMembersAndPhotos: [CrewMemberAndPhoto] = []
                try await withThrowingTaskGroup(of: (UIImage?, CrewMember).self) { group in
//                    var progress: Float = 0
                    for crewMember in crewData {
                        group.addTask {
                            guard let image = try? await self.networkManager.downloadImage(from: crewMember.image) else {
                                return (nil, crewMember)
                            }
                            return (image, crewMember)
                        }
                    }
                    for try await (image, crewMember) in group {
                        let photo = ImageCropper.crop(image)
                        crewMembersAndPhotos.append(CrewMemberAndPhoto(photo: photo, crewMember: crewMember))
//                        progress += 1
//                        loadingDelegate?.didChangeProgress(to: progress / Float(flightsData.count))
                    }
                }
                crew = crewMembersAndPhotos
                let cellData = generateCellData(from: crew)
                let snapshot = ganerateSnapshot(from: cellData)
                downloadingDelegate?.didFinishDownloading(with: .success(snapshot))
            } catch DownloadError.invalidResponse {
                print("Shit, invalid response...")
                downloadingDelegate?.didFinishDownloading(with: .failure(DownloadError.invalidResponse))
            } catch DownloadError.unableToParse {
                print("Shit, unable to parse...")
                downloadingDelegate?.didFinishDownloading(with: .failure(DownloadError.unableToParse))
            } catch {
                print("Shit, general failure...")
                downloadingDelegate?.didFinishDownloading(with: .failure(DownloadError.generalError))
            }
        }
    }
    
    // MARK: - Generating functions
    
    private func generateCellData(from data: [CrewMemberAndPhoto]) -> [CrewCellData] {
        data.map { CrewCellData(image: $0.photo, name: $0.crewMember.name) }
    }
    
    private func ganerateSnapshot(from data: [CrewCellData]) -> NSDiffableDataSourceSnapshot<Section, CrewCellData> {
        var snapshot = NSDiffableDataSourceSnapshot<Section, CrewCellData>()
        snapshot.appendSections([.main])
        snapshot.appendItems(data)
        return snapshot
    }
    
}
