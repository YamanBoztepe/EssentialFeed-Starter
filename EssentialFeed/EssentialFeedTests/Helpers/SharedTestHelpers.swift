//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Yaman Boztepe on 7.12.2025.
//

import Foundation

func anyNSError() -> NSError {
    NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    URL(string: "http://any-url.com")!
}
