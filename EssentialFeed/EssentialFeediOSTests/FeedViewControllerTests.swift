//
//  FeedViewControllerTests.swift
//  EssentialFeediOSTests
//
//  Created by Yaman Boztepe on 20.12.2025.
//

import XCTest

class FeedViewController: UIViewController {
    private var loader: FeedViewControllerTests.FeedLoaderSpy?
    
    convenience init(loader: FeedViewControllerTests.FeedLoaderSpy) {
        self.init()
        self.loader = loader
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader?.load()
    }
}

final class FeedViewControllerTests: XCTestCase {
    
    func test_init_doesNotLoadFeed() {
        let loader = FeedLoaderSpy()
        _ = FeedViewController(loader: loader)
        
        XCTAssertEqual(loader.loadCallCount, 0)
    }
    
    func test_viewDidLoad_loadsFeed() {
        let loader = FeedLoaderSpy()
        let sut = FeedViewController(loader: loader)
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(loader.loadCallCount, 1)
    }
    
    // MARK: - Helpers
    
    class FeedLoaderSpy {
        private(set) var loadCallCount: Int = 0
        
        func load() {
            loadCallCount += 1
        }
    }
}
