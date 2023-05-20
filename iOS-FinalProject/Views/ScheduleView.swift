//
//  ScheduleView.swift
//  iOS-FinalProject
//
//  Created by Lakna Attigala on 2023-05-18.
//

import UIKit

class ScheduleView: UICollectionViewCell {
    var scheduleID: String?
    
    let daysLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let exercisesLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let repeatScheduleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Delete", for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(daysLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(exercisesLabel)
        contentView.addSubview(repeatScheduleLabel)
        contentView.addSubview(deleteButton)
        
        daysLabel.translatesAutoresizingMaskIntoConstraints = false
        daysLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        daysLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.topAnchor.constraint(equalTo: daysLabel.bottomAnchor, constant: 5).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        exercisesLabel.translatesAutoresizingMaskIntoConstraints = false
        exercisesLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 5).isActive = true
        exercisesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        repeatScheduleLabel.translatesAutoresizingMaskIntoConstraints = false
        repeatScheduleLabel.topAnchor.constraint(equalTo: exercisesLabel.bottomAnchor, constant: 5).isActive = true
        repeatScheduleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        deleteButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func deleteButtonTapped() {
        // Your delete button logic goes here
    }
}
