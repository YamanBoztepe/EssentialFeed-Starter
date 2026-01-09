//
//  FeedImagePresenterTests.swift
//  EssentialFeed
//
//  Created by Yaman Boztepe on 9.01.2026.
//

import XCTest
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

extension FeedImageViewModel: Equatable where Image: Equatable {}

protocol FeedImageView {
    associatedtype Image
    
    func display(_ viewModel: FeedImageViewModel<Image>)
}

final class FeedImagePresenter<View: FeedImageView, Image> where View.Image == Image {
    private let view: View
    
    init(view: View) {
        self.view = view
    }
    
    func didStartLoadingImageData(for model: FeedImage) {
        view.display(FeedImageViewModel(
            description: model.description,
            location: model.location,
            image: nil,
            isLoading: true,
            shouldRetry: false))
    }
}

final class FeedImagePresenterTests: XCTestCase {
    
    func test_init_doesNotSendAnyMessage() {
        let view = ViewSpy<UIImage>()
        
        _ = FeedImagePresenter(view: view)
        
        XCTAssertTrue(view.messages.isEmpty)
    }
    
    func test_didStartLoadingImageData_displayFeedImage() {
        let view = ViewSpy<UIImage>()
        let sut = FeedImagePresenter(view: view)
        let image = uniqueImage()
        let viewModel = FeedImageViewModel<UIImage>(
            description: image.description,
            location: image.location,
            image: nil,
            isLoading: true,
            shouldRetry: false)
        
        sut.didStartLoadingImageData(for: image)
        
        XCTAssertEqual(view.messages, [.display(image: viewModel)])
    }
    
    // MARK: - Helpers
    
    final class ViewSpy<Image: Equatable>: FeedImageView {
        enum Messages: Equatable {
            case display(image: FeedImageViewModel<Image>)
        }
        
        private(set) var messages: [Messages] = []
        
        func display(_ viewModel: FeedImageViewModel<Image>) {
            messages.append(.display(image: viewModel))
        }
    }
}
