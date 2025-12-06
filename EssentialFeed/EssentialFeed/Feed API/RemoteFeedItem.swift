//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Yaman Boztepe on 6.12.2025.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}
