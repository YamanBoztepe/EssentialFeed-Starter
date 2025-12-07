//
//  LoadFeedFromCacheUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Yaman Boztepe on 7.12.2025.
//

import XCTest
import EssentialFeed

final class LoadFeedFromCacheUseCaseTests: XCTestCase {
    
    func test_init_doesNotMessageStoreUponCreation() {
        let (_, store) = makeSUT()
        
        XCTAssertEqual(store.receivedMessages, [])
    }
    
    func test_load_requestsCacheRetrieval() {
        let (sut, store) = makeSUT()
        
        sut.load { _ in }
        
        XCTAssertEqual(store.receivedMessages, [.retrieve])
    }
    
    func test_load_failsOnRetrieval() {
        let (sut, store) = makeSUT()
        let retrievalError = anyNSError()
        let exp = expectation(description: "Wait for load completion")
        
        var receivedError: Error?
        sut.load { result in
            switch result {
            case .failure(let error):
                receivedError = error
            default:
                XCTFail("Expected to fail, got \(result) instead")
            }
            
            exp.fulfill()
        }
        
        store.completeRetrieval(with: retrievalError)
        waitForExpectations(timeout: 1)
        
        XCTAssertEqual(retrievalError, receivedError as? NSError)
    }
    
    func test_load_deliversNoImagesOnEmptyCache() {
        let (sut, store) = makeSUT()
        let exp = expectation(description: "Wait for load completion")
        
        var receivedImages: [FeedImage]?
        sut.load { result in
            switch result {
            case .success(let images):
                receivedImages = images
            default:
                XCTFail("Expected to succeed, got \(result) instead")
            }
            
            exp.fulfill()
        }
        store.completeRetrievalWithEmptyCache()
        waitForExpectations(timeout: 1)
        
        XCTAssertEqual(receivedImages, [])
    }
    
    // MARK: - Helpers
    
    private func makeSUT(currentDate: @escaping () -> Date = Date.init, file: StaticString = #filePath, line: UInt = #line) -> (sut: LocalFeedLoader, store: FeedStoreSpy) {
        let store = FeedStoreSpy()
        let sut = LocalFeedLoader(store: store, currentDate: currentDate)
        trackForMemoryLeaks(store, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, store)
    }
    
    func anyNSError() -> NSError {
        NSError(domain: "any error", code: 0)
    }
}
