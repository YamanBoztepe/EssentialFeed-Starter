//
//  FeedViewControllerTests.swift
//  EssentialFeediOSTests
//
//  Created by Yaman Boztepe on 20.12.2025.
//

import XCTest

class FeedViewController {
    
    init(loader: FeedViewControllerTests.FeedLoaderSpy) {
        
    }
}

final class FeedViewControllerTests: XCTestCase {
    
    func test_init_doesNotLoadFeed() {
        let loader = FeedLoaderSpy()
        _ = FeedViewController(loader: loader)
        
        XCTAssertEqual(loader.loadCallCount, 0)
    }
    
    // MARK: - Helpers
    
    class FeedLoaderSpy {
        private(set) var loadCallCount: Int = 0
    }
}
