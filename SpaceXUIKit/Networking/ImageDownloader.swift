//
//  ImageDownloader.swift
//  SpaceXUIKit
//
//  Created by Jan Kučera on 07.02.2022.
//

import Foundation
import UIKit

protocol ImageDownloadable {
    func downloadImage(from urlString: String) async throws -> UIImage?
}

struct ImageDownloader: ImageDownloadable {
    
    private let session = URLSession.shared
    
    func downloadImage(from urlString: String) async throws -> UIImage? {
        // Make an url
        guard let url = URL(string: urlString) else { return nil }
        // Download data
        let (data, response) = try await session.data(from: url)
        // Verify response
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { return nil }
        // Convert data to image
        guard let image = UIImage(data: data) else { return nil }
        // Return result
        return image
    }
    
}
