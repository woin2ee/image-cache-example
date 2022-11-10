//
//  UIImage+.swift
//  ImageCacheExample
//
//  Created by Jaewon Yun on 2022/11/10.
//

import UIKit

extension UIImage {
    static var defaultThumbnail: UIImage {
        return UIImage(named: "") ?? UIImage()
    }
}
