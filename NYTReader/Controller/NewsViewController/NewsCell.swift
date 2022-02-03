//
//  NewsCell.swift
//  NYTReader
//
//  Created by tambanco 🥳 on 30.01.2022.
//  Copyright © 2022 Tambanco. All rights reserved.
//

import Foundation
import UIKit

class NewsCell: UITableViewCell {
    
    //reuseId
    static let reuseId = "NewsCell"
    
    let newsCoverImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Hoefler Text", size: 17.0)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: NewsCell.reuseId)
        
        addSubview(newsCoverImage)
        addSubview(newsTitleLabel)
        
        newsCoverImage.translatesAutoresizingMaskIntoConstraints = false
        newsCoverImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        newsCoverImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        newsCoverImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9).isActive = true
        newsCoverImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.15).isActive = true
        
        newsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        newsTitleLabel.leadingAnchor.constraint(equalTo: newsCoverImage.trailingAnchor, constant: 20).isActive = true
        newsTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true
        newsTitleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        newsTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
