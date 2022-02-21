//
//  CrewDetailVM.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 17.02.2022.
//

import UIKit

final class CrewDetailVM {
    
    private let memberData: CrewMemberAndPhoto
    
    init(crewMember: CrewMemberAndPhoto) {
        memberData = crewMember
    }
    
    var nameDescription: String {
        memberData.crewMember.name
    }
    
    var agencyDescription: String {
        memberData.crewMember.agency
    }
    
    var statusDescription: String {
        memberData.crewMember.status
    }
    
    var launchesDescription: String {
        String(memberData.crewMember.launches.count)
    }
    
    var memberPhoto: UIImage? {
        memberData.photo
    }
    
    var wikiURL: URL {
        URL(string: memberData.crewMember.wikipedia) ?? URL(string: "https://www.spacex.com")!
    }
    
}
