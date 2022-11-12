//
//  ImageLoader.swift
//  ImageCacheExample
//
//  Created by Jaewon Yun on 2022/11/10.
//

import UIKit
import Alamofire

struct ImageLoader {
    
    static private var cacheImages: [URLRequest : UIImage] = [:]
    
    static func patch(_ urlString: String) async -> UIImage? {
        guard let url = URL.init(string: urlString) else { return nil }
        return await patch(url)
    }
    
    static func patch(_ url: URL) async -> UIImage? {
        return await patch(URLRequest.init(url: url))
    }
    
    static func patch(_ urlRequest: URLRequest) async -> UIImage? {
        if let image = cacheImages[urlRequest] {
            return image
        }
        
        let session: Session = .init(configuration: .ephemeral)
        guard let imageData = try? await session.request(urlRequest)
            .serializingData()
            .value
        else { return nil }
        
        guard let image = UIImage.init(data: imageData) else {
            return nil
        }
        
        cacheImages[urlRequest] = image
        
        return image
    }
}
