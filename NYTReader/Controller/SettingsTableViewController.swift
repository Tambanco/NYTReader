//
//  SettingsTableViewController.swift
//  NYTReader
//
//  Created by tambanco 🥳 on 04.05.2021.
//  Copyright © 2021 Tambanco. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController
{
    
    @IBOutlet weak var tableSettings: UITableView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let nib = UINib.init(nibName: "SettingsTableViewCell", bundle: nil)
        self.tableSettings.register(nib, forCellReuseIdentifier: "SettingsTableViewCell")
        self.tableSettings.separatorStyle = .none
    
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as! SettingsTableViewCell
        
        cell.deviceModeLabel.text = "Mode as on the device"
        cell.darkModeLabel.text =  "Dark mode"

        return cell
    }
}
