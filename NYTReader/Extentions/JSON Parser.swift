//
//  JSON Parser.swift
//  NYTReader
//
//  Created by tambanco 🥳 on 04.05.2021.
//  Copyright © 2021 Tambanco. All rights reserved.
//

import Foundation
import SwiftyJSON

//MARK: - JSON Parser
extension NewsViewController
{
    func updateData(json: JSON)
    {
        if json["results"].exists()
        {
            let rawItems = json["results"].arrayValue
            if rawItems.count > 0
            {
                rawItems.forEach({ newsArray.append( Articles( title:      $0["title"].string ?? "issues with Title",
                                                                url:        $0["url"].string ?? "Issues with url",
                                                                imageURL:   $0["multimedia"][1]["url"].string ?? "Ussues with imageURL") ) })
            }
            tableNews.reloadData()
        }
        else
        {
            print("Data not available")
        }
    }
}
