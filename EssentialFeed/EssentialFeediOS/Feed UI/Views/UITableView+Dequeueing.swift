//
//  UITableView+Dequeueing.swift
//  EssentialFeed
//
//  Created by Yaman Boztepe on 29.12.2025.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
