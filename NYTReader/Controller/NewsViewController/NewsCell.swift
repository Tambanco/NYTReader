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
    
    let newsCoverImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
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
        
        addSubview(newsCoverImageView)
        addSubview(newsTitleLabel)
        
        newsCoverImageView.translatesAutoresizingMaskIntoConstraints = false
        newsCoverImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        newsCoverImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        newsCoverImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9).isActive = true
        newsCoverImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.15).isActive = true
        
        newsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        newsTitleLabel.leadingAnchor.constraint(equalTo: newsCoverImageView.trailingAnchor, constant: 20).isActive = true
        newsTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true
        newsTitleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        newsTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
