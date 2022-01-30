//
//  SectionsViewControllerTableViewController.swift
//  NYTReader
//
//  Created by tambanco 🥳 on 04.05.2021.
//  Copyright © 2021 Tambanco. All rights reserved.
//

import UIKit

class SectionsViewController: UIViewController {
    
    // MARK: - Properties
    var tableSections: UITableView!
    let sections = Sections()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableSectionInitializer()
    }
    
    func tableSectionInitializer() {
        
        tableSections = UITableView()
        tableSections.register(SectionCell.self, forCellReuseIdentifier: SectionCell.reuseId)
                        
        self.view.addSubview(tableSections)
        
        tableSections.dataSource = self
        tableSections.delegate = self
        tableSections.rowHeight = 40
        
        tableSections.translatesAutoresizingMaskIntoConstraints = false
        tableSections.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableSections.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableSections.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableSections.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToArticles" {
            if let indexPath = self.tableSections.indexPathForSelectedRow {
                let articleVC = segue.destination as! NewsViewController
                articleVC.section = sections.capitalizeFirstCharacter(sections.splitArray(sections.allSections))[indexPath.row]
                articleVC.navigationItem.title = sections.capitalizeFirstCharacter(sections.splitArray(sections.allSections))[indexPath.row]
            }
        }
    }
}

extension SectionsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.capitalizeFirstCharacter(sections.splitArray(sections.allSections)).count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SectionCell.reuseId, for: indexPath) as! SectionCell
        cell.sectionLabel.text = sections.capitalizeFirstCharacter(sections.splitArray(sections.allSections))[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToArticles", sender: indexPath)
    }
}
