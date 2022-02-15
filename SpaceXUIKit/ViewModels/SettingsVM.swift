//
//  SettingsVM.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 15.02.2022.
//

import Foundation

final class SettingsVM {
    
    @StoredBool(key: "loadingCrew") var isLoadingCrewRightAway: Bool
    @StoredInt(key: "appearance") var appearanceKey: Int
    
}
