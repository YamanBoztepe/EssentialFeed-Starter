//
//  FeedViewController+FakeRefreshControl.swift
//  EssentialFeed
//
//  Created by Yaman Boztepe on 29.12.2025.
//

import UIKit
import EssentialFeediOS

extension FeedViewController {
 
    class FakeRefreshControl: UIRefreshControl {
        private var _isRefreshing: Bool = false
        
        override var isRefreshing: Bool { _isRefreshing }
        
        override func beginRefreshing() {
            _isRefreshing = true
        }
        
        override func endRefreshing() {
            _isRefreshing = false
        }
    }
}
