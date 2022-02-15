//
//  SettingsVM.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 15.02.2022.
//

import UIKit

final class SettingsVM {
    
    @StoredBool(key: "loadingCrew") var isLoadingCrewRightAway: Bool
    @StoredInt(key: "appearance") var appearanceKey: Int
    
    func getSwitchState() -> Bool {
        switch isLoadingCrewRightAway {
        case true:
            return true
        case false:
            return false
        }
    }
    
    func getInterfaceStyle() -> UIUserInterfaceStyle {
        switch appearanceKey {
        case 0:
            return UIUserInterfaceStyle.unspecified
        case 1:
            return UIUserInterfaceStyle.light
        case 2:
            return UIUserInterfaceStyle.dark
        default:
            return UIUserInterfaceStyle.unspecified
        }
    }
    
}
