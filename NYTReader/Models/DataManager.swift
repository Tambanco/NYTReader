//
//  NewsManager.swift
//  NYTReader
//
//  Created by Tambanco on 12.04.2020.
//  Copyright © 2020 Tambanco. All rights reserved.
//

import Foundation

struct DataManager{
    
    let dataURL = "http://api.nytimes.com/svc/topstories/v2/world.json?api-key=2AY5aYQX2U3y4ytAuiNg7N6u9AMrsPpg"
    
}
func performRequest(urlString: String){
    
    if let url = URL(string: urlString){
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil{
                print(error!)
                return
            }
            if let safeData = data{
                parseJSON(newsData: safeData)
            }
        }
        task.resume()
    }
}
func parseJSON(newsData: Data){
    
}

