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
    
    let notificationManager: LocalNotificationManager
    
    init(notificationManager: LocalNotificationManager = LocalNotificationManager()) {
        self.notificationManager = notificationManager
    }
    
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
    
    func showTestingLocalNotification() {
        // Setup content
        let content = UNMutableNotificationContent()
        content.title = "Pssst, hey"
        content.subtitle = "Local notification showcase"
        content.body = "This is mighty and great local notification that is simply just a feast for your eyes.."
        // Create local notification
        notificationManager.scheduleTimeBasedNotification(after: 3, using: content)
    }
    
}
