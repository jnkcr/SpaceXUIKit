//
//  LocalNotificationManager.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 22.02.2022.
//

import Foundation
import UserNotifications

struct LocalNotificationManager {
    
    private let notificationCenter = UNUserNotificationCenter.current()
    
    func scheduleTimeBasedNotification(after interval: Double, using content: UNMutableNotificationContent, isRepeating: Bool = false, identifier: String = UUID().uuidString) {
        // Make trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: isRepeating)
        // Make request
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        // Add request to notification center
        notificationCenter.add(request)
    }
    
    func scheduleCalendarBasedNotification(at date: DateComponents, using content: UNMutableNotificationContent, repeating: Bool = false, identifier: String = UUID().uuidString) {
        // Make trigger
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: repeating)
        // Make request
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        // Add request to notification center
        notificationCenter.add(request)
    }
    
}
