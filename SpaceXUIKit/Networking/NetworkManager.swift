//
//  NetworkManager.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 07.02.2022.
//

import Foundation
import UIKit





final class NetworkManager {
    
    private let flightsDownloader: FlightsDownloadable
    private let imageDownloader: ImageDownloadable
    
    init(flightsDownloader: FlightsDownloadable = FlightsDownloader(), imageDownloader: ImageDownloadable = ImageDownloader()) {
        self.flightsDownloader = flightsDownloader
        self.imageDownloader = imageDownloader
    }
    
    func downloadFlights() async throws -> [Flight] {
        try await flightsDownloader.downloadAllPastFlights()
    }
    
}
