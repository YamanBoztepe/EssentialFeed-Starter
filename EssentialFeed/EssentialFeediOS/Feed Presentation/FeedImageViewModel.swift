//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Yaman Boztepe on 25.12.2025.
//

import Foundation
import EssentialFeed

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        location != nil
    }
}
