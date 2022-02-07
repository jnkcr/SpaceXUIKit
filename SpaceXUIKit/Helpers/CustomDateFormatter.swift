//
//  CustomDateFormatter.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 07.02.2022.
//

import Foundation

struct CustomDateFormatter {
    
    static func formatUTCDate(from string: String?) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        guard let str = string else { return "n/a" }
        guard let date = formatter.date(from: str) else { return "n/a" }
        
        return date.formatted(date: .long, time: .omitted)
    }
    
}
