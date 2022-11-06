//
//  WithPullDownMenuViewController.swift
//  ImageCacheExample
//
//  Created by Jaewon Yun on 2022/11/06.
//

import UIKit

final class WithPullDownMenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let photoTableVC = self.children.first as! PhotoTableViewController
        photoTableVC.setPhotos([
            .init(albumID: 1, id: 1, title: "1", url: "1", thumbnailURL: "1"),
            .init(albumID: 1, id: 1, title: "1", url: "1", thumbnailURL: "1"),
            .init(albumID: 1, id: 1, title: "1", url: "1", thumbnailURL: "1"),
            .init(albumID: 1, id: 1, title: "1", url: "1", thumbnailURL: "1")
        ])
    }
}
