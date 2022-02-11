//
//  ImageCropper.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 11.02.2022.
//

import UIKit

struct ImageCropper {
    
    static func cropImage(_ origImage: UIImage) -> UIImage? {
        let size = CGSize(width: origImage.size.width, height: origImage.size.width)
        let originPoint = CGPoint(x: 0, y: 0)
        let cropArea = CGRect(origin: originPoint, size: size)
        
        guard let temporaryImage: CGImage = origImage.cgImage?.cropping(to: cropArea) else { return nil }
        
        return UIImage(cgImage: temporaryImage)
    }
    
}
