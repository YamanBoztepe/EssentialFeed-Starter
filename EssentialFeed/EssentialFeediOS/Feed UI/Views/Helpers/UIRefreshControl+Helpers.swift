//
//  UIRefreshControl+Helpers.swift
//  EssentialFeed
//
//  Created by Yaman Boztepe on 8.01.2026.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
