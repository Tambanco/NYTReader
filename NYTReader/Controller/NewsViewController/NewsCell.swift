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
        image.backgroundColor = .red
        return image
    }()
    
    let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Hoefler Text", size: 17.0)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.backgroundColor = .blue
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: NewsCell.reuseId)
        
        // 1 layer
        addSubview(newsCoverImage)
        addSubview(newsTitleLabel)
        
        newsCoverImage.translatesAutoresizingMaskIntoConstraints = false
        newsCoverImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        newsCoverImage.trailingAnchor.constraint(equalTo: newsTitleLabel.leadingAnchor, constant: -10).isActive = true
        newsCoverImage.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
//        newsCoverImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        newsCoverImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        newsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        newsTitleLabel.leadingAnchor.constraint(equalTo: newsCoverImage.trailingAnchor).isActive = true
        newsTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        newsTitleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        newsTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
