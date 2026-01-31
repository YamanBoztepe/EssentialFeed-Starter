//
//  SceneDelegateTests.swift
//  EssentialApp
//
//  Created by Yaman Boztepe on 24.01.2026.
//

import XCTest
import EssentialFeediOS
@testable import EssentialApp

final class SceneDelegateTests: XCTestCase {
    
    func test_configureWindow_setsWindowAsKeyAndVisible() throws {
        let window = try UIWindowSpy.make()
        let sut = SceneDelegate()
        sut.window = window
        
        sut.configureWindow()
        
        XCTAssertEqual(window.makeKeyAndVisibleCallCount, 1, "Expected to make window key and visible")
    }
    
    func test_configureWindow_configuresRootViewController() throws {
        let sut = SceneDelegate()
        sut.window = try UIWindowSpy.make()
        
        sut.configureWindow()
        
        let root = sut.window?.rootViewController
        let rootNavigation = root as? UINavigationController
        let topController = rootNavigation?.topViewController
        
        XCTAssertNotNil(rootNavigation)
        XCTAssertTrue(topController is FeedViewController)
    }
    
    private class UIWindowSpy: UIWindow {
        var makeKeyAndVisibleCallCount = 0
        
        static func make() throws -> UIWindowSpy {
            let dummyScene = try XCTUnwrap((UIWindowScene.self as NSObject.Type).init() as? UIWindowScene)
            return UIWindowSpy(windowScene: dummyScene)
        }
                
        override func makeKeyAndVisible() {
            makeKeyAndVisibleCallCount += 1
        }
    }
}
