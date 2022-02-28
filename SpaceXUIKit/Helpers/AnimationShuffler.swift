//
//  AnimationShuffler.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 18.02.2022.
//

import Foundation

struct AnimationShuffler {
    
    enum AnimationKind {
        case rocket, astronaut
    }
    
    private static let rockets: [String] = ["rocket02", "rocket03"]
    private static let astronauts: [String] = ["astronaut01", "astronaut04"]
    
    static func getAnimationName(for kind: AnimationKind) -> String {
        switch kind {
        case .rocket:
            return rockets.randomElement() ?? "rocket02"
        case .astronaut:
            return astronauts.randomElement() ?? "astronaut01"
        }
    }
    
}
