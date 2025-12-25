//
//  FeedViewModel.swift
//  EssentialFeed
//
//  Created by Yaman Boztepe on 25.12.2025.
//

import EssentialFeed

final class FeedViewModel {
    typealias Oberserver<T> = (T) -> Void
    
    private let feedLoader: FeedLoader
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    var onLoadingStateChange: Oberserver<Bool>?
    var onFeedLoad: Oberserver<[FeedImage]>?
    
    func loadFeed() {
        onLoadingStateChange?(true)
        feedLoader.load { [weak self] result in
            if let feed = try? result.get() {
                self?.onFeedLoad?(feed)
            }
            
            self?.onLoadingStateChange?(false)
        }
    }
}
