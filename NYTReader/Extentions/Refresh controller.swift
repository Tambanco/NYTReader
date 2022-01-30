//
//  Refresh controller.swift
//  NYTReader
//
//  Created by tambanco 🥳 on 04.05.2021.
//  Copyright © 2021 Tambanco. All rights reserved.
//

import Foundation

// MARK: - Refresh controller
extension NewsViewController
{
    @objc func refresh(sender:AnyObject)
    {
        getData(url: basicURL)
        tableNews.refreshControl?.endRefreshing()
    }
}
