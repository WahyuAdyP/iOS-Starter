//
//  Config.swift
//  iOStarter
//
//  Created by Crocodic MBP-2 on 28/07/18.
//  Copyright © 2018 WahyuAdyP. All rights reserved.
//

import Foundation
import UIKit

class Config {
    static let shared = Config()
    
    /// Type of compress photo quality
    ///
    /// - lowestJPEG: Compressed image data to 0% of original image without transparent in image
    /// - lowJPEG: Compressed image data to 25% of original image without transparent in image
    /// - mediumJPEG: Compressed image data to 50% of original image without transparent in image
    /// - highJPEG: Compressed image data to 75% of original image without transparent in image
    /// - highestJPEG: Uncompressed image data without transparent in image
    /// - uncompressedPNG: Uncompressed image data
    enum PhotoQuality {
        case lowestJPEG
        case lowJPEG
        case mediumJPEG
        case highJPEG
        case highestJPEG
        case uncompressedPNG
    }
    
    /// Process to convert image to data
    ///
    /// - Parameters:
    ///   - image: Image that want to convert
    ///   - quality: Quality of converted image
    /// - Returns: Data of image
    func setImageData(_ image: UIImage, quality: PhotoQuality) -> Data? {
        var data: Data? = nil
        switch quality {
        case .lowestJPEG:
            data = image.lowestQualityJPEGData
        case .lowJPEG:
            data = image.lowQualityJPEGData
        case .mediumJPEG:
            data = image.mediumQualityJPEGData
        case .highJPEG:
            data = image.highQualityJPEGData
        case .highestJPEG:
            data = image.highestQualityJPEGData
        case .uncompressedPNG:
            data = image.uncompressedPNGData
        }
        return data
    }
    
    /// Process to convert image to base64string
    ///
    /// - Parameters:
    ///   - image: Image that want to convert
    ///   - quality: Quality of converted image
    /// - Returns: Base64String image
    func setBase64Image(_ image: UIImage, quality: PhotoQuality) -> String? {
        let data = setImageData(image, quality: quality)
        let string = data?.base64EncodedString(options: .lineLength64Characters)
        return string
    }
    
    /// Resize image with same dimention for this application
    ///
    /// - Parameters:
    ///   - image: Image that want to resize
    func resizeImage(_ image: UIImage?) -> UIImage? {
        let newImage = image?.resize(to: CGSize(width: 350, height: 165))
        return newImage
    }
}