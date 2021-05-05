//
//  SettingsTableViewCell.swift
//  NYTReader
//
//  Created by tambanco 🥳 on 04.05.2021.
//  Copyright © 2021 Tambanco. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell
{
    // MARK: - Outlets
    @IBOutlet weak var deviceModeLabel: UILabel!
    @IBOutlet weak var darkModeLabel: UILabel!
    @IBOutlet weak var deviceModeSwitch: UISwitch!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    // MARK: - Properties
    let userDefaults = UserDefaults.standard

    override func awakeFromNib()
    {
        super.awakeFromNib()
        darkModeSwitch.isOn = userDefaults.bool(forKey: "SetDarkMode")
        deviceModeSwitch.isOn = userDefaults.bool(forKey: "SetSystemDarkMode")
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func setSystemDarkMode(_ sender: UISwitch)
    {
        if traitCollection.userInterfaceStyle == .light
        {
            window?.overrideUserInterfaceStyle = .light
            userDefaults.set(sender.isOn, forKey: "SetSystemDarkMode")
        }
        else
        {
            window?.overrideUserInterfaceStyle = .dark
            userDefaults.set(sender.isOn, forKey: "SetSystemDarkMode")
        }
    }
    
    @IBAction func setDarkMode(_ sender: UISwitch)
    {
        if sender.isOn == true
        {
            window?.overrideUserInterfaceStyle = .dark
            userDefaults.set(sender.isOn, forKey: "SetDarkMode")
        }
        else
        {
            window?.overrideUserInterfaceStyle = .light
            userDefaults.set(sender.isOn, forKey: "SetDarkMode")
        }
    }
}
