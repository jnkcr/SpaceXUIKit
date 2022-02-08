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
    
    var flights: [Flight]? = []
    
    init(manager: NetworkManager = NetworkManager()) {
        networkManager = manager
    }
    
    func loadFlights() {
        Task {
            do {
                let flightsData = try await networkManager.downloadFlights()
                flights = flightsData.sorted { $0.dateUtc > $1.dateUtc }
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
    
}
