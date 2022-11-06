//
//  Instantiatable.swift
//  ImageCacheExample
//
//  Created by Jaewon Yun on 2022/11/06.
//

import UIKit

protocol Instantiatable: UIViewController {
    static func instantiate(withStoryboardName storyboardName: String) -> Self
}

extension UIViewController: Instantiatable {
    static func instantiate(withStoryboardName storyboardName: String) -> Self {
        let storyboardID = String(describing: self)
        let storyboard = UIStoryboard.init(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: storyboardID) as! Self
    }
}
