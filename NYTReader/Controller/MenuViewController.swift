//
//  MenuViewController.swift
//  NYTReader
//
//  Created by Tambanco on 27.04.2020.
//  Copyright © 2020 Tambanco. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    let hexBackgroundColor = UserDefaults.standard.string(forKey: "background_color_hex") ?? "#FFFFFF"
    
    @IBOutlet weak var darkModeButton: UIButton!
    @IBOutlet weak var whiteModeButton: UIButton!
    @IBOutlet weak var textColorScheme: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hexString: hexBackgroundColor)
        
        darkModeButton.layer.cornerRadius = 15
        darkModeButton.layer.borderWidth = 2
        darkModeButton.layer.borderColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
        
        whiteModeButton.layer.cornerRadius = 15
        whiteModeButton.layer.borderWidth = 2
        whiteModeButton.layer.borderColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
        
    }
    @IBAction func whiteModeButtonPressed(_ sender: UIButton) {
        
        UserDefaults.standard.set("#FFFFFF", forKey: "background_color_hex")
        view.backgroundColor = UIColor(hexString: hexBackgroundColor)
        
        textColorScheme.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.loadView()
    }
    
    @IBAction func darkModeButtonPressed(_ sender: UIButton) {
        
        UserDefaults.standard.set("424242", forKey: "background_color_hex")
        view.backgroundColor = UIColor(hexString: hexBackgroundColor)
        textColorScheme.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

    }
    
}
