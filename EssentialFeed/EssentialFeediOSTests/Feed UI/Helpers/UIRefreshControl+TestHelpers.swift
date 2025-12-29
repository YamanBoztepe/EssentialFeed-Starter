//
//  UIRefreshControl+TestHelpers.swift
//  EssentialFeed
//
//  Created by Yaman Boztepe on 29.12.2025.
//

import UIKit

extension UIRefreshControl {
    func simulatePullToRefresh() {
        simulate(event: .valueChanged)
    }
}
