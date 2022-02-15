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
            print("Setting defaults for key <\(defaultKey)> to \(newValue)")
            defaults.set(newValue, forKey: defaultKey)
        }
        get {
            print("Getting defaults for key <\(defaultKey)>")
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
            print("Setting defaults for key <\(defaultKey)> to \(newValue)")
            defaults.set(newValue, forKey: defaultKey)
        }
        get {
            print("Getting defaults for key <\(defaultKey)>")
            return defaults.integer(forKey: defaultKey)
        }
    }
    
    init(key: String) {
        defaultKey = key
    }
    
}

