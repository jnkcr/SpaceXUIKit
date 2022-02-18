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
    
    private static let rockets: [String] = ["rocket01", "rocket02", "rocket03"]
    private static let astronauts: [String] = ["astronaut01", "astronaut02", "astronaut03"]
    
    static func getAnimationName(for kind: AnimationKind) -> String {
        switch kind {
        case .rocket:
            return rockets.randomElement() ?? "rocket01"
        case .astronaut:
            return astronauts.randomElement() ?? "astronaut01"
        }
    }
    
}
