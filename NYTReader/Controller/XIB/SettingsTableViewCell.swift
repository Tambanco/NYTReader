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
    

    override func awakeFromNib()
    {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

    }
    
}
