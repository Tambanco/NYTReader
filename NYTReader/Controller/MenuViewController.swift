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
    @IBOutlet weak var oceanModeButton: UIButton!
    @IBOutlet weak var textColorScheme: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font:UIFont(name: "Hoefler Text", size: 28) ?? "System"]
        
        darkModeButton.layer.cornerRadius = 15
        darkModeButton.layer.borderWidth = 2
        darkModeButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        whiteModeButton.layer.cornerRadius = 15
        whiteModeButton.layer.borderWidth = 2
        whiteModeButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        oceanModeButton.layer.cornerRadius = 15
        oceanModeButton.layer.borderWidth = 2
        oceanModeButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
    }
    @IBAction func whiteModeButtonPressed(_ sender: UIButton) {
        //
        //        UserDefaults.standard.set("#FFFFFF", forKey: "background_color_hex")
        //        view.backgroundColor = UIColor(hexString: hexBackgroundColor)
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textColorScheme.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font:UIFont(name: "Hoefler Text", size: 28) ?? "System"]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
    }
    
    @IBAction func darkModeButtonPressed(_ sender: UIButton) {
        
        //        UserDefaults.standard.set("424242", forKey: "background_color_hex")
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textColorScheme.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font:UIFont(name: "Hoefler Text", size: 28) ?? "System"]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    }
    
    @IBAction func oceanModeButtonPressed(_ sender: UIButton) {
        view.backgroundColor = #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)
        textColorScheme.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font:UIFont(name: "Hoefler Text", size: 28) ?? "System"]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(hexString: "#FFFFFF")]
    }
}
