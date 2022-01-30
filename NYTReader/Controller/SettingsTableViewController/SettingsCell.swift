//
//  SettingsCell.swift
//  NYTReader
//
//  Created by tambanco 🥳 on 30.01.2022.
//  Copyright © 2022 Tambanco. All rights reserved.
//

import Foundation
import UIKit

class SettingsCell: UITableViewCell {
    
    // reuseId
    static let reuseId = "SettingsCell"
    let userDefaults = UserDefaults.standard
    
    let deviceModeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Hoefler Text", size: 17.0)
        label.text = "Mode as on the device"
        return label
    }()
    
    let darkModeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Hoefler Text", size: 17.0)
        label.text = "Dark mode"
        return label
    }()
    
    let deviceModeSwitch: UISwitch = {
        let switchH = UISwitch()
        return switchH
    }()
    let darkModeSwitch: UISwitch = {
        let switchH = UISwitch()
        return switchH
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: SettingsCell.reuseId)
        
        // 1 layer
        addSubview(deviceModeLabel)
        addSubview(deviceModeSwitch)
        addSubview(darkModeLabel)
        addSubview(darkModeSwitch)
        
        // constraints
        deviceModeLabel.translatesAutoresizingMaskIntoConstraints = false
        deviceModeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        deviceModeLabel.trailingAnchor.constraint(equalTo: deviceModeSwitch.leadingAnchor, constant: 0).isActive = true
        deviceModeLabel.centerYAnchor.constraint(equalTo: deviceModeSwitch.centerYAnchor).isActive = true
        
        deviceModeSwitch.translatesAutoresizingMaskIntoConstraints = false
        deviceModeSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        deviceModeSwitch.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        deviceModeSwitch.leadingAnchor.constraint(equalTo: deviceModeLabel.trailingAnchor, constant: -20).isActive = true
        
        darkModeLabel.translatesAutoresizingMaskIntoConstraints = false
        darkModeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        darkModeLabel.trailingAnchor.constraint(equalTo: darkModeSwitch.leadingAnchor, constant: 0).isActive = true
        darkModeLabel.centerYAnchor.constraint(equalTo: darkModeSwitch.centerYAnchor).isActive = true
        
        darkModeSwitch.translatesAutoresizingMaskIntoConstraints = false
        darkModeSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        darkModeSwitch.topAnchor.constraint(equalTo: deviceModeSwitch.bottomAnchor, constant: 20).isActive = true
        darkModeSwitch.leadingAnchor.constraint(equalTo: darkModeLabel.trailingAnchor, constant: 20).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
