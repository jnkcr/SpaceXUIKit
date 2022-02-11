//
//  FlightDetailVM.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 08.02.2022.
//

import UIKit

final class FlightDetailVM {
    
    private let flightData: FlightAndPatch
    
    init(flight: FlightAndPatch) {
        flightData = flight
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
