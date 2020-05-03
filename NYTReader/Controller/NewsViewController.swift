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
import SideMenuSwift

class NewsViewController: UITableViewController, setColorScheme{
    
    var itemArray = [DataModel]()
    
    //    let bgColor = UserDefaults.standard.string(forKey: "background_color_hex") ?? "#FFFFFF"
    
    let dataURL = "https://api.nytimes.com/svc/topstories/v2/world.json?api-key=2AY5aYQX2U3y4ytAuiNg7N6u9AMrsPpg"
    
    @IBOutlet weak var cellImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = SettingsViewController.sharedInstance.backgroundColor
        
        tableView.rowHeight = 80
        self.refreshControl?.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        getData(url: dataURL)
    }
    
    //MARK: - Networking
    
    func getData(url: String){
        Alamofire.request(url, method: .get).responseJSON { response in
            if response.result.isSuccess {  
                let dataJSON = JSON(response.result.value!)
                print("Есть соединение, дата загружена")
                self.updateData(json: dataJSON)
                self.tableView.reloadData()
            }else{
                print("Error: \(String(describing: response.result.error))")
                print("Проблемы с соединием")
            }
        }
    }
    
    //MARK: - JSON Parsing
    
    func updateData(json: JSON)
    {
        if json["results"].exists()
        {
            let rawItems = json["results"].arrayValue
            
            if rawItems.count > 0 {
                rawItems.forEach({ itemArray.append( DataModel( title: $0["title"].string ?? "",
                                                                url: $0["url"].string ?? ""
//                                        ,
//                                                                                    imageURL: $0["multimedia"].arrayValue[1]["url"].string ?? ""
                ) ) })
            }
        }else{
            print("Дата недоступна")
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.backgroundColor = SettingsViewController.sharedInstance.backgroundColor
        cell.textLabel?.text = itemArray[indexPath.row].title
        cell.textLabel?.font = UIFont(name: "Hoefler Text", size: 17.0)
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.numberOfLines = 3
        cell.imageView?.kf.setImage(with: URL(string: itemArray[indexPath.row].imageURL))
        
        return cell
    }
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        //Pass the indexPath as sender
        self.performSegue(withIdentifier: "goToWebVersion", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToWebVersion" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let webVersionVC = segue.destination as! WebViewController
                webVersionVC.passingURL = itemArray[indexPath.row].url
                
            }
        }
    }
    @objc func refresh(sender:AnyObject)
    {
        getData(url: dataURL)
        
        self.refreshControl?.endRefreshing()
    }
    @IBAction func menuButtonPressed(_ sender: UIBarButtonItem) {
        self.sideMenuController?.revealMenu()

    }
    func colorSet(color: UIColor) {
        view.backgroundColor = color
    }
}
