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

class NewsViewController: UIViewController {
    // MARK: - Properties
    let basicURL: String        = URLs().basicURL
    let apiKey: String          = URLs().apiKey
    var newsArray: [Articles]   = []
    var section: String         = URLs().section
    var tableNews: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableNewsInitializer()
        buildURL(basicURL: basicURL, section: section, apiKey: apiKey)
    }

    func tableNewsInitializer() {
        tableNews = UITableView()
        tableNews.register(NewsCell.self, forCellReuseIdentifier: NewsCell.reuseId)

        view.addSubview(tableNews)
        
        tableNews.backgroundColor = .red
        tableNews.dataSource = self
        tableNews.delegate = self
//        tableNews.estimatedRowHeight = 80
//        tableNews.rowHeight = UITableView.automaticDimension
        tableNews.rowHeight = 60
        tableNews.refreshControl?.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        
        
        tableNews.translatesAutoresizingMaskIntoConstraints = false
        tableNews.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableNews.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableNews.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableNews.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
//        return UITableView.automaticDimension
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let processor = RoundCornerImageProcessor(cornerRadius: 10)
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseId, for: indexPath) as! NewsCell
        cell.accessoryType = .disclosureIndicator
        cell.newsTitleLabel.text = newsArray[indexPath.row].title
        
        cell.newsCoverImage.kf.indicatorType = .activity
        cell.newsCoverImage.kf.setImage(with: URL(string: newsArray[indexPath.row].imageURL),
                                        placeholder: UIImage(named: "placeholder"),
                                        options: [.transition(.fade(0.2)), .processor(processor)] )
        cell.newsCoverImage.kf.indicatorType = .activity
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToWebVersion", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToWebVersion" {
            if let indexPath = self.tableNews.indexPathForSelectedRow {
                let webVersionVC = segue.destination as! WebViewController
                webVersionVC.passingURL = newsArray[indexPath.row].url
            }
        }
    }
}








