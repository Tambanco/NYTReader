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
import Kingfisher

class NewsViewController: UITableViewController
{
    // MARK: - Properties
    var itemArray       = [DataModel]()
    let dataURL         = "https://api.nytimes.com/svc/topstories/v2/world.json?api-key=2AY5aYQX2U3y4ytAuiNg7N6u9AMrsPpg"
    
    // MARK: - Outlets
    @IBOutlet weak var cellImageView: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.rowHeight = 80
        self.refreshControl?.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        getData(url: dataURL)
    }
    
    //MARK: - Networking
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
    
    //MARK: - JSON Parsing
    func updateData(json: JSON)
    {
        if json["results"].exists()
        {
            let rawItems = json["results"].arrayValue
            if rawItems.count > 0
            {
                rawItems.forEach({ itemArray.append( DataModel( title: $0["title"].string ?? "issues with Title",
                                                                url: $0["url"].string ?? "Issues with url",
                                                                imageURL: $0["multimedia"][1]["url"].string ?? "Ussues with imageURL") ) })
            }
                tableView.reloadData()
        }
        else
        {
            print("Data not available")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        cell.textLabel?.font = UIFont(name: "Hoefler Text", size: 17.0)
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.numberOfLines = 2
        cell.imageView?.kf.setImage(with: URL(string: itemArray[indexPath.row].imageURL))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath)
    {
        self.performSegue(withIdentifier: "goToWebVersion", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "goToWebVersion"
        {
            if let indexPath = self.tableView.indexPathForSelectedRow
            {
                let webVersionVC = segue.destination as! WebViewController
                webVersionVC.passingURL = itemArray[indexPath.row].url
            }
        }
    }
}

// MARK: - Refresh controller
extension NewsViewController
{
    @objc func refresh(sender:AnyObject)
    {
        getData(url: dataURL)
        self.refreshControl?.endRefreshing()
    }
}
