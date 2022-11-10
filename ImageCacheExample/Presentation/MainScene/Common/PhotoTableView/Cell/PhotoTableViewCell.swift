//
//  PhotoTableViewCell.swift
//  ImageCacheExample
//
//  Created by Jaewon Yun on 2022/11/06.
//

import UIKit

final class PhotoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bind(photo: Photo) {
        Task {
            thumbnailImageView.image = await ImageLoader.patch(photo.thumbnailURL) ?? .defaultThumbnail
        }
        idLabel.text = "\(photo.id)"
        titleLabel.text = photo.title
    }
}
