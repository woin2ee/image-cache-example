//
//  ImageLoader.swift
//  ImageCacheExample
//
//  Created by Jaewon Yun on 2022/11/10.
//

import UIKit
import Alamofire

struct ImageLoader {
    
    private enum ImageLoaderError: Error {
        case nonRequested
        case nonexistentData
    }
    
    private enum LoadStatus {
        case fetched(UIImage)
        case inProgress(DataTask<Data>)
    }
    
    static private var imageCache: CacheManager<NSURLRequest, StructWrapper<LoadStatus>> = .init(name: "ImageCache")
    
    static func patch(_ urlString: String) async -> UIImage? {
        guard let url = URL.init(string: urlString) else { return nil }
        return await patch(url)
    }
    
    static func patch(_ url: URL) async -> UIImage? {
        return await patch(URLRequest.init(url: url))
    }
    
    static func patch(_ urlRequest: URLRequest) async -> UIImage? {
        if let image = try? await fetchCacheImageIfRequested(with: urlRequest).get() {
            return image
        }
        
        let session: Session = .init(configuration: .ephemeral)
        
        let dataTask = session.request(urlRequest).serializingData()
        imageCache.put(.init(.inProgress(dataTask)), forKey: urlRequest as NSURLRequest)
        
        guard let imageData = try? await dataTask.value,
              let image = UIImage.init(data: imageData)
        else {
            return nil
        }
        
        imageCache.put(.init(.fetched(image)), forKey: urlRequest as NSURLRequest)
        
        return image
    }
    
    private static func fetchCacheImageIfRequested(with urlRequest: URLRequest) async -> Result<UIImage?, ImageLoaderError> {
        guard let status = imageCache.get(by: urlRequest as NSURLRequest)?.value else {
            return .failure(.nonRequested)
        }
        
        switch status {
        case .fetched(let image):
            return .success(image)
        case .inProgress(let dataTask):
            if let imageData = try? await dataTask.value {
                return .success(UIImage.init(data: imageData))
            } else {
                return .failure(.nonexistentData)
            }
        }
    }
}
