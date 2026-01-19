//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Yaman Boztepe on 19.01.2026.
//

public protocol FeedCache {
    typealias SaveResult = Result<Void, Error>
    
    func save(_ feed: [FeedImage], completion: @escaping (SaveResult) -> Void)
}
