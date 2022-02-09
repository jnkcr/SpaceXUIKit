//
//  FlightsDownloader.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 07.02.2022.
//

import Foundation
import UIKit

protocol FlightsDownloadable {
    func downloadAllPastFlights() async throws -> [Flight]
}

struct FlightsDownloader: FlightsDownloadable {
    
    private let session = URLSession.shared
    private let decoder = JSONDecoder()
    
    func downloadAllPastFlights() async throws -> [Flight] {
        // Download data
        let (data, response) = try await session.data(from: URLAdresses.allPastLaunches)
        // Verify response
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FlightError.invalidResponse }
        // Decode data
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let flights = try? decoder.decode([Flight].self, from: data) else { throw FlightError.unableToParse }
        #if DEBUG
        dump(flights[0...2])
        #endif
        // Return result
        return flights
    }
    
}
