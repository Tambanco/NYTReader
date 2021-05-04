//
//  SectionsViewControllerTableViewController.swift
//  NYTReader
//
//  Created by tambanco 🥳 on 04.05.2021.
//  Copyright © 2021 Tambanco. All rights reserved.
//

import UIKit

class SectionsViewController: UITableViewController
{
    // MARK: - Properties
    @IBOutlet weak var tblUsers: UITableView!
    let sections = Sections()

    // MARK: - Life cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "SectionsTableViewCell", bundle: nil)
        self.tblUsers.register(nib, forCellReuseIdentifier: "SectionsTableViewCell")
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return sections.capitalizeFirstCharacter(sections.splitArray(sections.allSections)).count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionsTableViewCell", for: indexPath) as! SectionsTableViewCell
        cell.sectionLabel.text = sections.capitalizeFirstCharacter(sections.splitArray(sections.allSections))[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
