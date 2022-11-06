//
//  Photo.swift
//  ImageCacheExample
//
//  Created by Jaewon Yun on 2022/11/06.
//

import Foundation

struct Photo: Codable {
    let albumID: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailURL: String
    
    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id
        case title
        case url
        case thumbnailURL = "thumbnailUrl"
    }
}
