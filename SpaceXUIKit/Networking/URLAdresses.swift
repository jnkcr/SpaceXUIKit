//
//  URLadress.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 07.02.2022.
//

import Foundation

enum URLAdresses {
    static let allPastLaunches: URL = URL(string: "https://api.spacexdata.com/v5/launches/past")!
    static let allCrewMembers: URL = URL(string: "https://api.spacexdata.com/v4/crew")!
}
