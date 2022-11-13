//
//  CacheManager.swift
//  ImageCacheExample
//
//  Created by Jaewon Yun on 2022/11/13.
//

import UIKit

final class CacheManager<KeyType, T> where KeyType : AnyObject, T : AnyObject {
    
    private let _cache: NSCache<KeyType, T>
    
    init(name: String) {
        self._cache = .init()
        self._cache.name = name
    }
    
    func put(_ newObject: T, forKey key: KeyType) {
        _cache.setObject(newObject, forKey: key)
    }
    
    func get(by key: KeyType) -> T? {
        return _cache.object(forKey: key)
    }
}
