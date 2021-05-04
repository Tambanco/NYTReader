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
    var newsArray       = [DataModel]()
    let basicURL         = "https://api.nytimes.com/svc/topstories/v2/"
    var section         = "world"
    let apiKey          = "2AY5aYQX2U3y4ytAuiNg7N6u9AMrsPpg"
    
    // MARK: - Outlets
    @IBOutlet weak var cellImageView: UIImageView!
    
    // MARK: - Life cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.rowHeight = 80
        self.refreshControl?.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        buildURL(basicURL: basicURL, section: section, apiKey: apiKey)
    }

    // MARK: - Table View methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return newsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let processor = RoundCornerImageProcessor(cornerRadius: 10)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellWithNews", for: indexPath)
        cell.textLabel?.text = newsArray[indexPath.row].title
        cell.textLabel?.font = UIFont(name: "Hoefler Text", size: 17.0)
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.numberOfLines = 2
        
        cell.imageView?.kf.indicatorType = .activity
        cell.imageView?.kf.setImage( with: URL(string: newsArray[indexPath.row].imageURL),
                                     placeholder: UIImage(named: "placeholder"),
                                     options: [.transition(.fade(0.2)), .processor(processor)] )
        cell.imageView?.kf.indicatorType = .activity
        
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
                webVersionVC.passingURL = newsArray[indexPath.row].url
            }
        }
    }
}

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
                rawItems.forEach({ newsArray.append( DataModel( title:      $0["title"].string ?? "issues with Title",
                                                                url:        $0["url"].string ?? "Issues with url",
                                                                imageURL:   $0["multimedia"][1]["url"].string ?? "Ussues with imageURL") ) })
            }
                tableView.reloadData()
        }
        else
        {
            print("Data not available")
        }
    }
}

// MARK: - Refresh controller
extension NewsViewController
{
    @objc func refresh(sender:AnyObject)
    {
        getData(url: basicURL)
        self.refreshControl?.endRefreshing()
    }
}
