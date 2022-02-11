//
//  CrewDownloader.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 11.02.2022.
//

import Foundation

struct CrewDownloader {
    
    private let session = URLSession.shared
    private let decoder = JSONDecoder()
    
    func downloadAllCrewMembers() async throws -> [CrewMember] {
        // Download data
        let (data, response) = try await session.data(from: URLAdresses.allCrewMembers)
        // Verify response
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw DownloadError.invalidResponse }
        // Decode data
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let crewMembers = try? decoder.decode([CrewMember].self, from: data) else { throw DownloadError.unableToParse }
        #if DEBUG
        dump(crewMembers[0...2])
        #endif
        // Return result
        return crewMembers
    }
    
}
