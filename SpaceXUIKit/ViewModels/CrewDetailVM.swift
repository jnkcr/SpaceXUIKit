//
//  CrewDetailVM.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 17.02.2022.
//

import Foundation

final class CrewDetailVM {
    
    private let memberData: CrewMemberAndPhoto
    
    init(crewMember: CrewMemberAndPhoto) {
        memberData = crewMember
    }
    
    var nameDescription: String {
        memberData.crewMember.name
    }
    
}
