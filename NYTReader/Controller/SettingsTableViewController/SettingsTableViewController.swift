//
//  SettingsTableViewController.swift
//  NYTReader
//
//  Created by tambanco 🥳 on 04.05.2021.
//  Copyright © 2021 Tambanco. All rights reserved.
//

import UIKit

class SettingsTableViewController: UIViewController {
    // MARK: - Outlets
//    @IBOutlet weak var tableSettings: UITableView!
    var tableSettings: UITableView!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableSettingsInitializer()
    }
    
    func tableSettingsInitializer() {
        let tableSettings = UITableView()
        self.tableSettings.separatorStyle = .none
        view.addSubview(tableSettings)
        
        tableSettings.register(SettingsCell.self, forCellReuseIdentifier: SectionCell.reuseId)
        
        tableSettings.dataSource = self
        tableSettings.delegate = self
    }
}

extension SettingsTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.reuseId, for: indexPath) as! SettingsCell
        cell.deviceModeLabel.text = "Mode as on the device"
        cell.darkModeLabel.text =  "Dark mode"
        return cell
    }
}
