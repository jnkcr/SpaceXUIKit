//
//  FlightDetailViewModel.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 08.02.2022.
//

import Foundation

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
    
}
