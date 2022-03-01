//
//  CustomErrors.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 07.02.2022.
//

import Foundation

enum DownloadError: String, Error {
    case invalidResponse = "Response from server is weird. Please try again later."
    case unableToParse = "Data might be corrupted. Please try again later."
    case generalError = "There was an unexpected error. Please check your connection and try again."
}

enum NotificationError: Error {
    case invalidDate
}
