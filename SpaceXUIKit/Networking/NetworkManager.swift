//
//  NetworkManager.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 07.02.2022.
//

import UIKit

final class NetworkManager {
    
    private let flightsDownloader: FlightsDownloadable
    private let imageDownloader: ImageDownloadable
    private let crewDownloader: CrewDownloadable
    
    init(flightsDownloader: FlightsDownloadable = FlightDownloader(), imageDownloader: ImageDownloadable = ImageDownloader(), crewDownloader: CrewDownloadable = CrewDownloader()) {
        self.flightsDownloader = flightsDownloader
        self.imageDownloader = imageDownloader
        self.crewDownloader = crewDownloader
    }
    
    func downloadAllPastFlights() async throws -> [Flight] {
        try await flightsDownloader.downloadAllPastFlights()
    }
    
    func downloadImage(from urlStr: String) async throws -> UIImage? {
        try await imageDownloader.downloadImage(from: urlStr)
    }
    
    func downloadAllCrewMembers() async throws -> [CrewMember] {
        try await crewDownloader.downloadAllCrewMembers()
    }
    
}

// MARK: - Conformance

typealias FlightsAndImagesDownloadable = FlightsDownloadable & ImageDownloadable
typealias CrewAndImagesDownloadable = CrewDownloadable & ImageDownloadable

extension NetworkManager: FlightsDownloadable, ImageDownloadable, CrewDownloadable { }
