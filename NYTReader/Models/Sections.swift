//
//  Sections.swift
//  NYTReader
//
//  Created by tambanco 🥳 on 04.05.2021.
//  Copyright © 2021 Tambanco. All rights reserved.
//

import UIKit

class Sections
{
    let allSections: String = "arts, automobiles, books, business, fashion, food, health, home, insider, magazine, movies, nyregion, obituaries, opinion, politics, realestate, science, sports, sundayreview, technology, theater, t-magazine, travel, upshot, us, world"
   
    func splitArray(_ sections: String) -> [String]
    {
        return sections.components(separatedBy: ", ")
    }
    
}

