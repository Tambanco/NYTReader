//
//  MarkedViewController.swift
//  NYTReader
//
//  Created by Tambanco on 27.04.2020.
//  Copyright © 2020 Tambanco. All rights reserved.
//

import UIKit

class MarkedViewController: UITableViewController{
    
    var markedArticles = ["dfdf", "dfdg", "hhhh"]
    
    override func viewDidLoad() {
    super.viewDidLoad()
            
}
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return markedArticles.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "markedArticles", for: indexPath)
        
        cell.textLabel?.text = markedArticles[indexPath.row]
        
        return cell
    }
    
}
