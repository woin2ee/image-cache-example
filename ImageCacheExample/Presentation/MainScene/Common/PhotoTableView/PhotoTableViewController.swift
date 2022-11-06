//
//  PhotoTableViewController.swift
//  ImageCacheExample
//
//  Created by Jaewon Yun on 2022/11/06.
//

import UIKit

final class PhotoTableViewController: UITableViewController {
    
    private var photos: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setPhotos(_ photos: [Photo]) {
        self.photos = photos
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PhotoTableViewCell.self), for: indexPath) as! PhotoTableViewCell
        cell.bind(photo: photos[indexPath.row])
        return cell
    }
}
