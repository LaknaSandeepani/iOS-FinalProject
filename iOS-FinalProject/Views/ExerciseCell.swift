//
//  ExerciseCell.swift
//  iOS-FinalProject
//
//  Created by Lakna Attigala on 2023-05-16.
//

import UIKit

class ExerciseCell: UICollectionViewCell {
    
    // Create custom UI elements for exercise details
    let exerciseImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
     
        contentView.addSubview(exerciseImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(categoryLabel)
        
        
        exerciseImageView.translatesAutoresizingMaskIntoConstraints = false
        exerciseImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        exerciseImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        exerciseImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        exerciseImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: exerciseImageView.trailingAnchor, constant: 10).isActive = true

        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
