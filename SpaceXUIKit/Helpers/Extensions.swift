//
//  Extensions.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 09.02.2022.
//

import Foundation

extension Sequence {
    func asyncMap<T>(_ transform: (Element) async throws -> T) async rethrows -> [T] {
        var values = [T]()

        for element in self {
            try await values.append(transform(element))
        }

        return values
    }
}
