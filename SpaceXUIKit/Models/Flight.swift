//
//  Flight.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 07.02.2022.
//

import Foundation

struct Flight: Codable, Identifiable {
    let id: String
    let name: String
    let dateUtc: String
    let flightNumber: Int
}
