//
//  SpaceFlightsViewModel.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 07.02.2022.
//

import UIKit

protocol FlightsDownloadingDelegate {
    func didChangeProgress(to value: Float)
    func didFinishLoading(with result: Result<Void, DownloadError>)
}

final class SpaceFlightsVM {
    
    private let networkManager: NetworkManager
    var loadingDelegate: FlightsDownloadingDelegate?
    
    var flights: [FlightAndPatch] = []
    
    init(manager: NetworkManager = NetworkManager()) {
        networkManager = manager
    }
    
    func loadFlights() {
        Task {
            do {
                let flightsData: [Flight] = try await networkManager.downloadFlights()
                var flightsAndPatches: [FlightAndPatch] = []
                try await withThrowingTaskGroup(of: (UIImage?, Flight).self) { group in
                    var progress: Float = 0
                    for flight in flightsData {
                        group.addTask {
                            if let urlStr = flight.links.patch.small {
                                let image = try await self.networkManager.downloadImage(from: urlStr)
                                return (image, flight)
                            } else {
                                return (nil, flight)
                            }
                        }
                    }
                    for try await (image, flight) in group {
                        flightsAndPatches.append(FlightAndPatch(patchImage: image, flight: flight))
                        progress += 1
                        loadingDelegate?.didChangeProgress(to: progress / Float(flightsData.count))
                    }
                }
                flights = flightsAndPatches.sorted { $0.flight.dateUtc > $1.flight.dateUtc }
                loadingDelegate?.didFinishLoading(with: .success(Void()))
            } catch DownloadError.invalidResponse {
                loadingDelegate?.didFinishLoading(with: .failure(DownloadError.invalidResponse))
                print("Shit, invalid response...")
            } catch DownloadError.unableToParse {
                loadingDelegate?.didFinishLoading(with: .failure(DownloadError.unableToParse))
                print("Shit, unable to parse...")
            } catch {
                loadingDelegate?.didFinishLoading(with: .failure(DownloadError.generalError))
                print("Shit, general failure...")
            }
        }
    }
    
    func generateCellData(for index: Int) -> FlightCellData {
        let flight: FlightAndPatch = flights[index]
        let date: String = CustomDateFormatter.formatUTCDate(from: flight.flight.dateUtc, as: .long)
        return FlightCellData(image: flight.patchImage, date: date, title: flight.flight.name)
    }
    
}
