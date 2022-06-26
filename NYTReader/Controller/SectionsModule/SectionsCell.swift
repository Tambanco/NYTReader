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
    
    let sectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Section"
        label.font = UIFont(name: "Hoefler Text", size: 17.0)
        return label
    }()
    
    // initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: SectionCell.reuseId)
        exerciseAmbiguityInLayout()
        addSubview(sectionLabel)
        
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
