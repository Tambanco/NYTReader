//
//  ViewController.swift
//  NYTReader
//
//  Created by Tambanco on 12.04.2020.
//  Copyright © 2020 Tambanco. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class NewsViewController: UITableViewController {
    
    var itemArray = ["news1"]
    let dataURL = "https://api.nytimes.com/svc/topstories/v2/world.json?api-key=2AY5aYQX2U3y4ytAuiNg7N6u9AMrsPpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        getData(url: dataURL)
        
        return cell
    }
    
    //MARK: - Networking
    
    func getData(url: String){
        
        Alamofire.request(url, method: .get).responseJSON { response in
            if response.result.isSuccess {
                let dataJSON:JSON = JSON(response.result.value!)
                print("Есть соединение, дата загружена")
                self.updateData(json: dataJSON)
            }else{
                print("Error: \(String(describing: response.result.error))")
                print("Проблемы с соединием")
            }
        }
    }
    
    //MARK: - JSON Parsing
    
    func updateData(json: JSON) {
        if let dataResult = json["results"][0]["title"].string{
            
            print(dataResult)
            
            itemArray.append(dataResult)
            
        }else{
            print("Дата недоступна")
        }
        
    }
}
