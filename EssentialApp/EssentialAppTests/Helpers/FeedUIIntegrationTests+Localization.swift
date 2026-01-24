//
//  FeedUIIntegrationTests+Localization.swift
//  EssentialFeed
//
//  Created by Yaman Boztepe on 29.12.2025.
//

import Foundation
import EssentialFeed
import XCTest

extension FeedUIIntegrationTests {
    func localized(_ key: String, file: StaticString = #file, line: UInt = #line) -> String {
        let table = "Feed"
        let bundle = Bundle(for: FeedPresenter.self)
        let localizedString = bundle.localizedString(forKey: key, value: nil, table: table)
        XCTAssertNotEqual(key, localizedString, "Missing localized string for key: \(key) in table: \(table)", file: file, line: line)
        return localizedString
    }
}
