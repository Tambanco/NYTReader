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

class NewsViewController: UITableViewController {
    // MARK: - Properties
    let basicURL: String        = URLs().basicURL
    let apiKey: String          = URLs().apiKey
    var newsArray: [Articles]   = []
    var section: String         = URLs().section

    // MARK: - Outlets
    @IBOutlet weak var tableNews: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "NewsTableViewCell", bundle: nil)
        self.tableNews.register(nib, forCellReuseIdentifier: "NewsTableViewCell")
        tableNews.estimatedRowHeight = 80
        tableNews.rowHeight = UITableView.automaticDimension
        self.refreshControl?.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        buildURL(basicURL: basicURL, section: section, apiKey: apiKey)
    }

    // MARK: - Table View methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let processor = RoundCornerImageProcessor(cornerRadius: 10)
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.newsTitleLabel?.text = newsArray[indexPath.row].title
        cell.newsTitleLabel?.font = UIFont(name: "Hoefler Text", size: 17.0)
        cell.newsTitleLabel?.lineBreakMode = .byWordWrapping
        cell.newsTitleLabel?.numberOfLines = 2
        
        cell.newsCoverImage?.kf.indicatorType = .activity
        cell.newsCoverImage?.kf.setImage( with: URL(string: newsArray[indexPath.row].imageURL),
                                          placeholder: UIImage(named: "placeholder"),
                                          options: [.transition(.fade(0.2)), .processor(processor)] )
        cell.newsCoverImage?.kf.indicatorType = .activity
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToWebVersion", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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









