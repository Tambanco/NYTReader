//
//  SettingsTableViewController.swift
//  NYTReader
//
//  Created by tambanco 🥳 on 04.05.2021.
//  Copyright © 2021 Tambanco. All rights reserved.
//

import UIKit

class SettingsTableViewController: UIViewController {
    
    var tableSettings: UITableView!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableSettingsInitializer()
    }
    
    func tableSettingsInitializer() {
        tableSettings = UITableView()
        tableSettings.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.reuseId)
        self.view.addSubview(tableSettings)
        
        tableSettings.separatorStyle = .none
        tableSettings.rowHeight = 120
        
        tableSettings.dataSource = self
        tableSettings.delegate = self
        
        tableSettings.translatesAutoresizingMaskIntoConstraints = false
        tableSettings.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableSettings.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableSettings.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableSettings.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
}

extension SettingsTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableSettings.dequeueReusableCell(withIdentifier: SettingsCell.reuseId, for: indexPath) as! SettingsCell
        cell.selectionStyle = .none
        return cell
    }
}
