//
//  PropertyWrappers.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 15.02.2022.
//

import Foundation

@propertyWrapper
struct StoredBool {
    private let defaultKey: String
    private let defaults = UserDefaults.standard
    
    var wrappedValue: Bool {
        set {
            defaults.set(newValue, forKey: defaultKey)
        }
        get {
            return defaults.bool(forKey: defaultKey)
        }
    }
    
    init(key: String) {
        defaultKey = key
    }
    
}

@propertyWrapper
struct StoredInt {
    private let defaultKey: String
    private let defaults = UserDefaults.standard
    
    var wrappedValue: Int {
        set {
            defaults.set(newValue, forKey: defaultKey)
        }
        get {
            return defaults.integer(forKey: defaultKey)
        }
    }
    
    init(key: String) {
        defaultKey = key
    }
    
}

