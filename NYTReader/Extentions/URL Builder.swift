//
//  URL Builder.swift
//  NYTReader
//
//  Created by tambanco 🥳 on 04.05.2021.
//  Copyright © 2021 Tambanco. All rights reserved.
//

import Foundation

//MARK: - URL Builder
extension NewsViewController
{
    func buildURL(basicURL: String, section: String, apiKey: String)
    {
        let urlForRequest = basicURL + section + ".json?" + "api-key=" + apiKey
        getData(url: urlForRequest)
        self.refreshControl?.endRefreshing()
    }
}
