//
//  NotificationCalendarVM.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 22.02.2022.
//

import Foundation
import UserNotifications

final class NotificationCalendarVM {
    
    let notificationManager: LocalNotificationManager
    
    var datePicked: Date = Date()
    var textfieldInput: String = ""
    
    init(notificationManager: LocalNotificationManager = LocalNotificationManager()) {
        self.notificationManager = notificationManager
    }
    
    func scheduleCalendarBasedNotification(then completion: (Result<Void, Error>) -> Void) {
        // Check if setting notification in future
        guard datePicked > Date.now else {
            completion(.failure(NotificationError.invalidDate))
            return
        }
        // Notification text
        let bodyText = textfieldInput.isEmpty ? "This is just a simple calendar based notification to help you grow as a iOS programmer." : textfieldInput
        // Setup content
        let content = UNMutableNotificationContent()
        content.title = "Hi there!"
        content.subtitle = "Calendar-based notification"
        content.body = bodyText
        content.sound = .default
        // Setup date
        let calendar = Calendar.current
        let date = calendar.dateComponents([.minute, .hour, .day, .month], from: datePicked)
        // Create notification
        notificationManager.scheduleCalendarBasedNotification(at: date, using: content)
        completion(.success(Void()))
    }
    
}
