//
//  StructWrapper.swift
//  ImageCacheExample
//
//  Created by Jaewon Yun on 2022/11/13.
//

import Foundation

final class StructWrapper<T>: NSObject {
    
    let value: T
    
    init(_ _struct: T) {
        self.value = _struct
    }
}
