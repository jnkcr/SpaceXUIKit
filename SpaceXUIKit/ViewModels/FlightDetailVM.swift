//
//  FlightDetailVM.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 08.02.2022.
//

import UIKit

protocol FlightImagesDelegate {
    func didFinishDownloadingImages()
}

final class FlightDetailVM {
    
    private let flightData: FlightAndPatch
    private let networkManager: ImageDownloadable
    private var flightImages: [UIImage?] = []
    
    var flightImagesDelegate: FlightImagesDelegate?
    
    init(flight: FlightAndPatch, ntwManager: ImageDownloadable = NetworkManager()) {
        flightData = flight
        networkManager = ntwManager
    }
    
    var name: String {
        flightData.flight.name
    }
    
    var description: String {
        flightData.flight.details ?? "No details provided."
    }
    
    var dateDescription: String {
        CustomDateFormatter.formatUTCDate(from: flightData.flight.dateUtc, as: .abbreviated)
    }
    
    var crewMembersDescription: String {
        "\(flightData.flight.crew.count) Mmbrs"
    }
    
    var successDescription: String {
        flightData.flight.success ? "Success" : "Failure"
    }
    
    var successImage: UIImage {
        flightData.flight.success ? UIImage(systemName: "checkmark.circle")! : UIImage(systemName: "xmark.circle")!
    }
    
    lazy var buttonLinks: FlightButtonLinks = {
        FlightButtonLinks(articleURL: generateURL(for: .article), wikipediaURL: generateURL(for: .wiki), youtubeURL: generateURL(for: .youtube))
    }()
    
}

// MARK: - Downloading

extension FlightDetailVM {
    
    func downloadImages() {
        Task {
            var images: [UIImage?] = []
            var links: [String] = []
            if !(flightData.flight.links.flickr.small.isEmpty) {
                flightData.flight.links.flickr.small.forEach { link in
                    guard let strURL = link else { return }
                    links.append(strURL)
                }
            } else if !(flightData.flight.links.flickr.original.isEmpty) {
                flightData.flight.links.flickr.original.forEach { link in
                    guard let strURL = link else { return }
                    links.append(strURL)
                }
            } else {
                return
            }
            try await withThrowingTaskGroup(of: UIImage?.self) { group in
                for link in links {
                    group.addTask {
                        let image = try await self.networkManager.downloadImage(from: link)
                        return image
                    }
                }
                for try await img in group {
                    images.append(img)
                }
            }
            flightImages = images
            flightImagesDelegate?.didFinishDownloadingImages()
        }
    }
    
}

// MARK: - Helper functions

extension FlightDetailVM {
    
    enum Link {
        case article, wiki, youtube
    }
    
    private func generateURL(for source: Link) -> URL {
        let failureURL: URL = URL(string: "https://www.spacex.com")!
        switch source {
        case .article:
            guard let urlStr = flightData.flight.links.article else { return failureURL }
            return URL(string: urlStr)!
        case .wiki:
            guard let urlStr = flightData.flight.links.wikipedia else { return failureURL }
            return URL(string: urlStr)!
        case .youtube:
            guard let urlStr = flightData.flight.links.webcast else { return failureURL }
            return URL(string: urlStr)!
        }
    }
    
}
