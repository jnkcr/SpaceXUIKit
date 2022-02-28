//
//  Extensions.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 09.02.2022.
//

import UIKit

extension Sequence {
    func asyncMap<T>(_ transform: (Element) async throws -> T) async rethrows -> [T] {
        var values = [T]()
        for element in self {
            try await values.append(transform(element))
        }
        return values
    }
}

extension UIViewController {
    
    func shownCustomAlert(title: String = "Error", description: String, confirmationText: String = "Ok") {
        DispatchQueue.main.async {
            let vc = AlertVC(titleText: title, description: description, buttonConfirmationText: confirmationText)
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.present(vc, animated: true)
        }
    }
    
    func shownCustomAlertAfter(interval: Double = 1.0, title: String = "Error", description: String, confirmationText: String = "Ok") {
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            let vc = AlertVC(titleText: title, description: description, buttonConfirmationText: confirmationText)
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.present(vc, animated: true)
        }
    }
    
}
