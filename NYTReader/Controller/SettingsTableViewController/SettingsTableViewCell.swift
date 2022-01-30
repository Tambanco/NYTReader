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

    override func awakeFromNib() {
        super.awakeFromNib()
        darkModeSwitch.isOn = userDefaults.bool(forKey: "SetDarkMode")
        deviceModeSwitch.isOn = userDefaults.bool(forKey: "SetSystemDarkMode")
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//    }
    
    // MARK: - DeviceModeSwitch
    @IBAction func setSystemDarkMode(_ sender: UISwitch) {
        if sender.isOn == true {
            setDarkAppearance(traitCollection.userInterfaceStyle, sender.isOn, "SetSystemDarkMode")
        } else {
            setDarkAppearance(.light, sender.isOn, "SetSystemDarkMode")
        }
    }
        
    // MARK: - DarkModeSwitch
    @IBAction func setDarkMode(_ sender: UISwitch) {
        if sender.isOn == true {
            setDarkAppearance(.dark, sender.isOn, "SetDarkMode")
        } else {
            setDarkAppearance(.light, sender.isOn, "SetDarkMode")
        }
    }
}

    // MARK: - Dark mode setter
extension SettingsTableViewCell {
    func setDarkAppearance(_ inputMode: UIUserInterfaceStyle, _ senderIsOn: Bool, _ key: String) {
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = inputMode
        }
        userDefaults.setValue(senderIsOn, forKey: key)
    }
}
