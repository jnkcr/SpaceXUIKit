//
//  Flight.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 07.02.2022.
//

import Foundation

// MARK: - Flight
struct Flight: Codable, Identifiable {
    let id: String
    let name: String
    let dateUtc: String
    let flightNumber: Int
    let success: Bool
    let crew: [Crew]
    let links: Links
    let details: String?
}

// MARK: - Crew
struct Crew: Codable {
    let crew: String?
    let role: String?
}

// MARK: - Links
struct Links: Codable {
    let patch: Patch
    let flickr: Flickr
    let webcast: String?
    let article: String?
    let wikipedia: String?
}

// MARK: - Patch
struct Patch: Codable {
    let small: String?
    let large: String?
}

// MARK: - Flickr
struct Flickr: Codable {
    let small: [String?]
    let original: [String?]
}
