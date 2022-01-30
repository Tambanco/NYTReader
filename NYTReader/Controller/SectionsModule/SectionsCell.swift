//
//  SectionsCell.swift
//  NYTReader
//
//  Created by tambanco 🥳 on 30.01.2022.
//  Copyright © 2022 Tambanco. All rights reserved.
//

import Foundation
import UIKit

class SectionCell: UITableViewCell {
    
    //reuse Id
    static let reuseId = "SectionCell"
    
    let tableViewCell: UITableView = {
        let view = UITableView()
        view.backgroundColor = .red
        return view
    }()
    
    let sectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Section"
        label.font = UIFont(name: "Hoefler Text", size: 17.0)
        label.backgroundColor = .yellow
        return label
    }()
    
    // initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: SectionCell.reuseId)
        
        // 1 layer
        addSubview(tableViewCell)
        
        tableViewCell.translatesAutoresizingMaskIntoConstraints = false
        tableViewCell.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableViewCell.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableViewCell.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableViewCell.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        // 2 layer
        tableViewCell.addSubview(sectionLabel)
        
        sectionLabel.translatesAutoresizingMaskIntoConstraints = false
        sectionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        sectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        sectionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        sectionLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
