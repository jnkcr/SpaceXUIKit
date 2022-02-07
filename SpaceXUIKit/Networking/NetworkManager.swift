//
//  NetworkManager.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 07.02.2022.
//

import Foundation

protocol SpaceFlightsDownloadable {
    func downloadAllPastFlights() async throws -> [Flight]
}

final class NetworkManager {
    
    private let flightsDownloader: SpaceFlightsDownloadable
    
    init(flightsDownloader: SpaceFlightsDownloadable = FlightsDownloader()) {
        self.flightsDownloader = flightsDownloader
    }
    
    func downloadFlights() async throws -> [Flight] {
        try await flightsDownloader.downloadAllPastFlights()
    }
    
}
