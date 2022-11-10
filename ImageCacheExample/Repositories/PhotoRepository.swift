//
//  PhotoRepository.swift
//  ImageCacheExample
//
//  Created by Jaewon Yun on 2022/11/06.
//

import Foundation
import Alamofire

final class PhotoRepository {
    
    func getPhotos(byAlbumID albumID: Int) async -> [Photo]? {
        let absoluteURL = "https://jsonplaceholder.typicode.com/albums/\(albumID)/photos"
        
        let session: Session = {
            let configuration: URLSessionConfiguration = .default
            configuration.timeoutIntervalForRequest = 10
            configuration.timeoutIntervalForResource = 10
            return .init(configuration: configuration)
        }()
        
        return try? await session
            .request(absoluteURL)
            .serializingDecodable([Photo].self)
            .value
    }
}
