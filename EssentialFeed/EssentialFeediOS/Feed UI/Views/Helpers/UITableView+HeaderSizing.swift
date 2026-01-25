//
//  UITableView+HeaderSizing.swift
//  EssentialFeed
//
//  Created by Yaman Boztepe on 25.01.2026.
//

import UIKit

extension UITableView {
    func sizeTableHeaderToFit() {
        guard let header = tableHeaderView else { return }
        
        let size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        
        let needsFrameUpdate = header.frame.height != size.height
        if needsFrameUpdate {
            header.frame.size.height = size.height
            tableHeaderView = header
        }
    }
}
