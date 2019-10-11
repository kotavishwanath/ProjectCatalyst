//
//  AsyncImageView.swift
//  FilesApp
//
//  Created by Vishwanath Kota on 01/10/2019.
//  Copyright © 2019 Vishwanath Kota. All rights reserved.
//
//https://www.youtube.com/watch?v=QsdI8vK5mlI
import UIKit
//This class accepts the Image
class AsyncImageView: UIView{
    private var _image: UIImage?
    
    var image: UIImage? {
        get {
            return _image
        }
        
        set {
            _image = newValue
            layer.contents = nil
            guard let image = newValue else { return }
            DispatchQueue.global(qos: .userInitiated).async {
                let decodedImage = self.decodeImage(image)
                DispatchQueue.main.async {
                    self.layer.contents = decodedImage?.cgImage
                }
            }
        }
    }
    
    func decodeImage(_ image: UIImage) -> UIImage? {
        guard let newImage = image.cgImage else { return nil }
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: nil, width: newImage.width, height: newImage.height, bitsPerComponent: 8, bytesPerRow: newImage.width*4, space: colorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)
        context?.draw(newImage, in: CGRect(x: 0, y: 0, width: newImage.width, height: newImage.height))
        let decodedImage = context?.makeImage()
        if let decodedImage = decodedImage {
            return UIImage(cgImage: decodedImage)
        }
        return nil
    }

}
