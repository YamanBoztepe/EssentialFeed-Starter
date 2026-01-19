//
//  FeedLoaderCacheDecorator.swift
//  EssentialApp
//
//  Created by Yaman Boztepe on 19.01.2026.
//

import EssentialFeed

public final class FeedLoaderCacheDecorator: FeedLoader {
    private let decoratee: FeedLoader
    private let cache: FeedCache
    
    public init(decoratee: FeedLoader, cache: FeedCache) {
        self.decoratee = decoratee
        self.cache = cache
    }
    
    public func load(completion: @escaping (FeedLoader.Result) -> Void) {
        decoratee.load { result in
            completion(result.map { [weak self] feed in
                self?.cache.save(feed) { _ in }
                return feed
            })
        }
    }
}
