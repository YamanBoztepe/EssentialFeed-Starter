//
//  FeedErrorViewModel.swift
//  EssentialFeed
//
//  Created by Yaman Boztepe on 8.01.2026.
//

struct FeedErrorViewModel {
    let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
