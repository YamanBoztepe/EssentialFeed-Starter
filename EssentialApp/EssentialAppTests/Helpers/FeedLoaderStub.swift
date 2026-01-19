//
//  FeedLoaderStub.swift
//  EssentialApp
//
//  Created by Yaman Boztepe on 19.01.2026.
//

import EssentialFeed

class FeedLoaderStub: FeedLoader {
    private let result: FeedLoader.Result
    
    init(result: FeedLoader.Result) {
        self.result = result
    }
    
    func load(completion: @escaping (FeedLoader.Result) -> Void) {
        completion(result)
    }
}
