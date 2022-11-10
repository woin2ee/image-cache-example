//
//  ImageLoader.swift
//  ImageCacheExample
//
//  Created by Jaewon Yun on 2022/11/10.
//

import UIKit
import Alamofire

struct ImageLoader {
    
    static func patch(_ urlString: String) async -> UIImage? {
        guard let url = URL.init(string: urlString) else { return nil }
        return await patch(url)
    }
    
    static func patch(_ url: URL) async -> UIImage? {
        return await patch(URLRequest.init(url: url))
    }
    
    static func patch(_ urlRequest: URLRequest) async -> UIImage? {
        guard let imageData = try? await AF.request(urlRequest)
            .serializingData()
            .value
        else { return nil }
        
        return UIImage.init(data: imageData)
    }
}
