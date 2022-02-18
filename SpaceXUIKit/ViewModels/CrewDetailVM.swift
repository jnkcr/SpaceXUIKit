//
//  CrewDetailVM.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 17.02.2022.
//

import Foundation
import UIKit

final class CrewDetailVM {
    
    private let memberData: CrewMemberAndPhoto
    
    init(crewMember: CrewMemberAndPhoto) {
        memberData = crewMember
    }
    
    var nameDescription: String {
        memberData.crewMember.name
    }
    
    var memberPhoto: UIImage? {
        memberData.photo
    }
    
}
