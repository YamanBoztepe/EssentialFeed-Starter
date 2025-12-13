//
//  EssentialFeedCacheIntegrationTests.swift
//  EssentialFeedCacheIntegrationTests
//
//  Created by Yaman Boztepe on 13.12.2025.
//

import XCTest
import EssentialFeed

final class EssentialFeedCacheIntegrationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        setupEmptyStoreState()
    }
    
    override func tearDown() {
        super.tearDown()
        
        setupEmptyStoreState()
    }
    
    func test_load_deliversNoItemsOnEmptyCache() {
        let sut = makeSUT()
        
        expect(sut, toLoad: [])
    }
    
    func test_load_deliversItemsSavedOnASeperateInstance() {
        let sutToPerformSave = makeSUT()
        let sutToPerformLoad = makeSUT()
        let feed = uniqueImageFeed().models
        
        let saveExp = expectation(description: "wait for save to complete")
        sutToPerformSave.save(feed) { saveError in
            XCTAssertNil(saveError, "Expected to save without error")
            saveExp.fulfill()
        }
        waitForExpectations(timeout: 1)
        
        expect(sutToPerformLoad, toLoad: feed)
    }
    
    func test_save_overridesItemsSavedOnASeperateInstance() {
        let sutToPerformSave1 = makeSUT()
        let sutToPerformSave2 = makeSUT()
        let sutToPerformLoad = makeSUT()
        let feed1 = uniqueImageFeed().models
        let feed2 = uniqueImageFeed().models
        
        let saveExp1 = expectation(description: "wait for first save to complete")
        sutToPerformSave1.save(feed1) { saveError in
            XCTAssertNil(saveError, "Expected to save without error")
            saveExp1.fulfill()
        }
        waitForExpectations(timeout: 1)
        
        let saveExp2 = expectation(description: "wait for second save to complete")
        sutToPerformSave2.save(feed2) { saveError in
            XCTAssertNil(saveError, "Expected to save without error")
            saveExp2.fulfill()
        }
        waitForExpectations(timeout: 1)
        
        expect(sutToPerformLoad, toLoad: feed2)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> LocalFeedLoader {
        let bundle = Bundle(for: CoreDataFeedStore.self)
        let storeURL = testSpecificStoreURL()
        let store = try! CoreDataFeedStore(storeURL: storeURL, bundle: bundle)
        let sut = LocalFeedLoader(store: store, currentDate: Date.init)
        trackForMemoryLeaks(store, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return sut
    }
    
    private func expect(_ sut: LocalFeedLoader, toLoad expectedImageFeed: [FeedImage], file: StaticString = #filePath, line: UInt = #line) {
        let exp = expectation(description: "wait for load completion")
        sut.load { result in
            switch result {
            case .success(let receivedImageFeed):
                XCTAssertEqual(receivedImageFeed, expectedImageFeed, file: file, line: line)
                
            case .failure(let error):
                XCTFail("Expected successful feed result, got \(error) instead.", file: file, line: line)
            }
            
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 1)
    }
    
    private func testSpecificStoreURL() -> URL {
        cachesDirectory().appendingPathComponent("\(type(of: self)).store")
    }
    
    private func cachesDirectory() -> URL {
        FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
    }
    
    private func setupEmptyStoreState() {
        deleteStoreArtifacts()
    }
    
    private func undoStoreSideEffect() {
        deleteStoreArtifacts()
    }
    
    private func deleteStoreArtifacts() {
        try? FileManager.default.removeItem(at: testSpecificStoreURL())
    }
}
