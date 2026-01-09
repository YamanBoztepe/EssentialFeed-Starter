//
//  FeedErrorViewModel.swift
//  EssentialFeed
//
//  Created by Yaman Boztepe on 9.01.2026.
//


import Foundation

public struct FeedErrorViewModel {
    public let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}