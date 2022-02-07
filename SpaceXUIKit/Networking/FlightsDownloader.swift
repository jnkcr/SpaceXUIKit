//
//  FlightsDownloader.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 07.02.2022.
//

import Foundation

struct FlightsDownloader: SpaceFlightsDownloadable {
    
    let session = URLSession.shared
    let decoder = JSONDecoder()
    
    func downloadAllPastFlights() async throws -> [Flight] {
        // Download data
        let (data, response) = try await session.data(from: URLAdress.allPastLaunches)
        // Verify response
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FlightError.invalidResponse }
        // Decode data
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let flights = try? decoder.decode([Flight].self, from: data) else { throw FlightError.unableToParse }
        #if DEBUG
        dump(flights[0...4])
        #endif
        // Return result
        return flights
    }
    
}
