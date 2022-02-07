//
//  SpaceFlightsViewModel.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 07.02.2022.
//

import Foundation

protocol SpaceFlightsDownloadingDelegate {
    func didFinishLoading(with result: Result<Void, FlightError>)
}

final class SpaceFlightsViewModel {
    
    private let networkManager: NetworkManager
    var loadingDelegate: SpaceFlightsDownloadingDelegate?
    
    var flights: [Flight]? = []
    
    init(manager: NetworkManager = NetworkManager()) {
        networkManager = manager
    }
    
    func loadFlights() {
        Task {
            do {
                flights = try await networkManager.downloadFlights()
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
