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
        // Check aspect ratio
        let ratio = image.size.width / image.size.height
        // Cropping area
        var size = CGSize(width: 0, height: 0)
        var originPoint = CGPoint(x: 0, y: 0)
        var cropArea = CGRect(origin: originPoint, size: size)
        // Calculate cropping area
        switch ratio <= 1 {
        case true:
            size = CGSize(width: image.size.width, height: image.size.width)
            originPoint = CGPoint(x: 0, y: 0)
            cropArea = CGRect(origin: originPoint, size: size)
        case false:
            size = CGSize(width: image.size.height, height: image.size.height)
            let originX = (image.size.width - image.size.height) / 2
            originPoint = CGPoint(x: originX, y: 0)
            cropArea = CGRect(origin: originPoint, size: size)
        }
        // Crop image
        guard let temporaryImage: CGImage = image.cgImage?.cropping(to: cropArea) else { return nil }
        // Return image
        return UIImage(cgImage: temporaryImage)
    }
    
}
