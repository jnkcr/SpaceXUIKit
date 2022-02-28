//
//  CrewMember.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 11.02.2022.
//

import Foundation

struct CrewMember: Codable, Identifiable {
    let id: String
    let name: String
    let agency: String
    let image: String
    let wikipedia: String
    let launches: [String]
    let status: String
}
