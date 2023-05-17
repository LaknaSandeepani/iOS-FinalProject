//
//  ExerciseDetailViewController.swift
//  iOS-FinalProject
//
//  Created by Lakna Attigala on 2023-05-17.
//

import UIKit

class ExerciseDetailsViewController: UIViewController {
    private let exercise: Exercise
    
    // Add any necessary UI elements to display the details of the exercise
    // For example, you can use labels to display the exercise name, description, images, etc.
    
    init(exercise: Exercise) {
        self.exercise = exercise
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup your UI elements and layout constraints
        
        // Example: Display the exercise name in a label
        let nameLabel = UILabel()
        nameLabel.text = exercise.name
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        // Add layout constraints for the label
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
