//
//  SharedTestHelpers.swift
//  EssentialApp
//
//  Created by Yaman Boztepe on 18.01.2026.
//

import Foundation
import EssentialFeed

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}

func anyData() -> Data {
    return Data("any data".utf8)
}

func uniqueFeed() -> [FeedImage] {
    [FeedImage(id: UUID(), description: "any description", location: "any location", url: URL(string: "https://any-url.com")!)]
}
