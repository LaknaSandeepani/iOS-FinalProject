//
//  ScheduleView.swift
//  iOS-FinalProject
//
//  Created by Lakna Attigala on 2023-05-18.
//

import UIKit

class ScheduleView: UICollectionViewCell {

    let daysLabel: UILabel = {
        let label = UILabel()
        // Configure label properties for days
        return label
    }()

    let exercisesLabel: UILabel = {
        let label = UILabel()
        // Configure label properties for exercises
        return label
    }()

    let repeatScheduleLabel: UILabel = {
        let label = UILabel()
        // Configure label properties for repeatSchedule
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add the custom UI elements to the cell's contentView
        contentView.addSubview(daysLabel)
        contentView.addSubview(exercisesLabel)
        contentView.addSubview(repeatScheduleLabel)
        
        // Add layout constraints for the custom UI elements
        // Adjust constraints based on your desired layout

        daysLabel.translatesAutoresizingMaskIntoConstraints = false
        daysLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        daysLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        exercisesLabel.translatesAutoresizingMaskIntoConstraints = false
        exercisesLabel.topAnchor.constraint(equalTo: daysLabel.bottomAnchor, constant: 5).isActive = true
        exercisesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true

        repeatScheduleLabel.translatesAutoresizingMaskIntoConstraints = false
        repeatScheduleLabel.topAnchor.constraint(equalTo: exercisesLabel.bottomAnchor, constant: 5).isActive = true
        repeatScheduleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
