//
//  ConstraintsHelpers.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 08.02.2022.
//

import UIKit

enum ConstraintsHelper {
    static let padding: CGFloat = 16
    static let tinySpacing: CGFloat = 5
    static let smallSpacing: CGFloat = 10
    static let mediumSpacing: CGFloat = 25
    static let largeSpacing: CGFloat = 60
    static let screenSize: CGFloat = UIScreen.main.bounds.width
    static let screenSizeWithoutPadding: CGFloat = UIScreen.main.bounds.width - (2 * padding)
    static let screenSizeWithoutTinyPaddingAndSpacingDividedByTwo: CGFloat = (UIScreen.main.bounds.width - (2 * padding) - tinySpacing) / 2
    static let screenSizeWithoutSmallPaddingAndSpacingDividedByTwo: CGFloat = (UIScreen.main.bounds.width - (2 * padding) - smallSpacing) / 2
    static let screenSizeWithoutPaddingDividedByThree: CGFloat = (UIScreen.main.bounds.width - (2 * padding)) / 3
}
