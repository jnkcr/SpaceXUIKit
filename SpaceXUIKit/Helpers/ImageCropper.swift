//
//  ImageCropper.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 11.02.2022.
//

import UIKit

struct ImageCropper {
    
    static func crop(_ image: UIImage?) -> UIImage? {
        // Check if there is any photo
        guard let image = image else { return nil }
        // Prepare cropping area
        let size = CGSize(width: image.size.width, height: image.size.width)
        let originPoint = CGPoint(x: 0, y: 0)
        let cropArea = CGRect(origin: originPoint, size: size)
        // Crop image
        guard let temporaryImage: CGImage = image.cgImage?.cropping(to: cropArea) else { return nil }
        // Return image
        return UIImage(cgImage: temporaryImage)
    }
    
}
