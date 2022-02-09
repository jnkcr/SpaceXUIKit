//
//  SpaceFlightsViewModel.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 07.02.2022.
//

import Foundation
import UIKit

protocol FlightsDownloadingDelegate {
    func didFinishLoading(with result: Result<Void, FlightError>)
}

final class SpaceFlightsViewModel {
    
    private let networkManager: NetworkManager
    var loadingDelegate: FlightsDownloadingDelegate?
    
    var flights: [FlightAndPatch] = []
    
    init(manager: NetworkManager = NetworkManager()) {
        networkManager = manager
    }
    
    func loadFlights() {
        Task {
            do {
                let flightsData = try await networkManager.downloadFlights()
                let flightsAndPatches: [FlightAndPatch] = try await flightsData.asyncMap { flight in
                    if let urlStr = flight.links.patch.small {
                        let patch = try await networkManager.downloadImage(from: urlStr)
                        return FlightAndPatch(patchImage: patch, flight: flight)
                    } else {
                        return FlightAndPatch(patchImage: nil, flight: flight)
                    }
                }
                flights = flightsAndPatches.sorted { $0.flight.dateUtc > $1.flight.dateUtc }
                loadingDelegate?.didFinishLoading(with: .success(Void()))
            } catch FlightError.unableToDownload {
                loadingDelegate?.didFinishLoading(with: .failure(FlightError.unableToDownload))
                print("Shit, unable to download...")
            } catch FlightError.invalidResponse {
                loadingDelegate?.didFinishLoading(with: .failure(FlightError.invalidResponse))
                print("Shit, invalid response...")
            } catch FlightError.unableToParse {
                loadingDelegate?.didFinishLoading(with: .failure(FlightError.unableToParse))
                print("Shit, unable to parse...")
            } catch {
                loadingDelegate?.didFinishLoading(with: .failure(FlightError.generalError))
                print("Shit, general failure...")
            }
        }
    }
    
    func generateCellData(for index: Int) -> CellData {
        let flight: FlightAndPatch = flights[index]
        let date: String = CustomDateFormatter.formatUTCDate(from: flight.flight.dateUtc, as: .long)
        return CellData(image: flight.patchImage, date: date, title: flight.flight.name)
    }
    
}
