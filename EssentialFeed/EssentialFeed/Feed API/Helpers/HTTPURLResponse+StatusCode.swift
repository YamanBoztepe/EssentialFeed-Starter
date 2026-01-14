//
//  HTTPURLResponse+StatusCode.swift
//  EssentialFeed
//
//  Created by Yaman Boztepe on 14.01.2026.
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }

    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}
