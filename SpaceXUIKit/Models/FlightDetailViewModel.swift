//
//  FlightDetailViewModel.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 08.02.2022.
//

import UIKit

final class FlightDetailVM {
    
    private let flightData: Flight
    
    init(flight: Flight) {
        flightData = flight
    }
    
    var name: String {
        flightData.name
    }
    
    var description: String {
        flightData.details ?? "No details provided."
    }
    
    var dateDescription: String {
        CustomDateFormatter.formatUTCDate(from: flightData.dateUtc, as: .abbreviated)
    }
    
    var crewMembersDescription: String {
        "\(flightData.crew.count) Mmbrs"
    }
    
    var successDescription: String {
        flightData.success ? "Success" : "Failure"
    }
    
    var successImage: UIImage {
        flightData.success ? UIImage(systemName: "checkmark.circle")! : UIImage(systemName: "xmark.circle")!
    }
    
    lazy var buttonLinks: ButtonLinks = {
        ButtonLinks(articleURL: generateURL(for: .article), wikipediaURL: generateURL(for: .wiki), youtubeURL: generateURL(for: .youtube))
    }()
    
}

extension FlightDetailVM {
    
    enum Link {
        case article, wiki, youtube
    }
    
    private func generateURL(for source: Link) -> URL {
        let failureURL: URL = URL(string: "https://www.spacex.com")!
        switch source {
        case .article:
            guard let urlStr = flightData.links.article else { return failureURL }
            return URL(string: urlStr)!
        case .wiki:
            guard let urlStr = flightData.links.wikipedia else { return failureURL }
            return URL(string: urlStr)!
        case .youtube:
            guard let urlStr = flightData.links.webcast else { return failureURL }
            return URL(string: urlStr)!
        }
    }
    
}
