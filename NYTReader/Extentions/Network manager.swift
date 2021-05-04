//
//  Network manager.swift
//  NYTReader
//
//  Created by tambanco 🥳 on 04.05.2021.
//  Copyright © 2021 Tambanco. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

// MARK: - Network manager
extension NewsViewController
    {
        func getData(url: String)
        {
            Alamofire.request(url, method: .get).responseJSON { response in
                if response.result.isSuccess
                {
                    let dataJSON = JSON(response.result.value!)
                    print("Data has downloaded")
                    self.updateData(json: dataJSON)
                }
                else
                {
                    print("Error: \(String(describing: response.result.error))")
                    print("Connection problems")
                }
            }
        }
    }
