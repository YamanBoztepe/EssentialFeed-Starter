//
//  FeedImageDataCache.swift
//  EssentialFeed
//
//  Created by Yaman Boztepe on 19.01.2026.
//

import EssentialFeed
import Foundation

public protocol FeedImageDataCache {
    typealias SaveResult = Result<Void, Error>
    
    func save(_ data: Data, for url: URL, completion: @escaping (SaveResult) -> Void)
}
