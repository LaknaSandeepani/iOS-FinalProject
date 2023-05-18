//
//  ScheduleView.swift
//  iOS-FinalProject
//
//  Created by Lakna Attigala on 2023-05-18.
//

import UIKit

class ScheduleView: UICollectionViewCell {
    // Create custom UI elements for exercise details
    let nameLabel: UILabel = {
        let label = UILabel()
        // Configure label properties
        return label
    }()
    
    // Add other UI elements as needed
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        contentView.backgroundColor = .blue
        // Add the custom UI elements to the cell's contentView
        contentView.addSubview(nameLabel)
        
        // Add layout constraints for the custom UI elements
        // Adjust constraints based on your desired layout
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
