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
        thumbnailImageView.image = {
            if let imageURL = URL(string: photo.thumbnailURL),
               let imageData = try? Data(contentsOf: imageURL),
               let image = UIImage(data: imageData) {
                return image
            } else {
                return UIImage()
            }
        }()
        idLabel.text = "\(photo.id)"
        titleLabel.text = photo.title
    }
}
