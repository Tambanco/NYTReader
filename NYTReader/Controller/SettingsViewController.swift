//
//  MenuViewController.swift
//  NYTReader
//
//  Created by Tambanco on 27.04.2020.
//  Copyright © 2020 Tambanco. All rights reserved.
//

import UIKit

protocol setColorScheme{
    func colorSet(color: UIColor)
}
class SettingsViewController: UIViewController {
    
    var delegate: setColorScheme?
    
    static let sharedInstance = SettingsViewController()
    var backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) // set to white by default.
    var newsVC = NewsViewController()
    
    @IBOutlet weak var darkModeButton: UIButton!
    @IBOutlet weak var whiteModeButton: UIButton!
    @IBOutlet weak var oceanModeButton: UIButton!
    @IBOutlet weak var textColorScheme: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = SettingsViewController.sharedInstance.backgroundColor
        
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
        
        let whiteColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        SettingsViewController.sharedInstance.backgroundColor = whiteColor
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textColorScheme.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font:UIFont(name: "Hoefler Text", size: 28) ?? "System"]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        
        delegate?.colorSet(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    }
    
    @IBAction func darkModeButtonPressed(_ sender: UIButton) {
        
        let blackColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        SettingsViewController.sharedInstance.backgroundColor = blackColor
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textColorScheme.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font:UIFont(name: "Hoefler Text", size: 28) ?? "System"]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        
        delegate?.colorSet(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
    }
    
    @IBAction func oceanModeButtonPressed(_ sender: UIButton) {
        
        let oceanColor = #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)
        SettingsViewController.sharedInstance.backgroundColor = oceanColor
        view.backgroundColor = #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)
        textColorScheme.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font:UIFont(name: "Hoefler Text", size: 28) ?? "System"]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(hexString: "#FFFFFF")]
        
        delegate?.colorSet(color: #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1))
    }
}
