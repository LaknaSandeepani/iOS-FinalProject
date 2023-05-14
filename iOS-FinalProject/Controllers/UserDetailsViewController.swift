//
//  UserDetailsViewController.swift
//  iOS-FinalProject
//
//  Created by Lakna Attigala on 2023-05-12.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    // MARK: - UI Elements
    
    private let detailsLabel: UILabel = {
        let label = UILabel()
        label.text = "User Details Capture"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    
    private let heightLabel: UILabel = {
        let label = UILabel()
        label.text = "Height (cm)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let heightTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.text = "Weight (kg)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weightTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Age"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let ageTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Gender"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let genderTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private let fitnessGoalLabel: UILabel = {
        let label = UILabel()
        label.text = "Fitness Goal"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let fitnessGoalTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Send", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return button
    }()

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "User Details"
        view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
    }
    
    // MARK: - Private Functions
    
    private func setupViews() {
        view.addSubview(detailsLabel)
        view.addSubview(heightLabel)
        view.addSubview(heightTextField)
        view.addSubview(weightLabel)
        view.addSubview(weightTextField)
        view.addSubview(ageLabel)
        view.addSubview(ageTextField)
        view.addSubview(genderLabel)
        view.addSubview(genderTextField)
        view.addSubview(fitnessGoalLabel)
        view.addSubview(fitnessGoalTextField)
        view.addSubview(sendButton)
        
    }
    
    private func setupConstraints() {
        let margins = view.layoutMarginsGuide
        
        // Details Label Constraints
        NSLayoutConstraint.activate([
            detailsLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            detailsLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20)
        ])

        // Height Label Constraints
        NSLayoutConstraint.activate([
            heightLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            heightLabel.topAnchor.constraint(equalTo: detailsLabel.topAnchor, constant: 80)
        ])

        // Height Text Field Constraints
        NSLayoutConstraint.activate([
            heightTextField.leadingAnchor.constraint(equalTo: heightLabel.leadingAnchor),
            heightTextField.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 20),
            heightTextField.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])

        // Weight Label Constraints
        NSLayoutConstraint.activate([
            weightLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            weightLabel.topAnchor.constraint(equalTo: heightTextField.bottomAnchor, constant: 30)
        ])

        // Weight Text Field Constraints
        NSLayoutConstraint.activate([
            weightTextField.leadingAnchor.constraint(equalTo: weightLabel.leadingAnchor),
            weightTextField.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 20),
            weightTextField.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])

        // Age Label Constraints
        NSLayoutConstraint.activate([
            ageLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            ageLabel.topAnchor.constraint(equalTo: weightTextField.bottomAnchor, constant: 30)
        ])

        // Age Text Field Constraints
        NSLayoutConstraint.activate([
            ageTextField.leadingAnchor.constraint(equalTo: ageLabel.leadingAnchor),
            ageTextField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 20),
            ageTextField.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])
        
        // Gender Label Constraints
        NSLayoutConstraint.activate([
            genderLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            genderLabel.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 30)
        ])

        // Gender Text Field Constraints
        NSLayoutConstraint.activate([
            genderTextField.leadingAnchor.constraint(equalTo: genderLabel.leadingAnchor),
            genderTextField.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 20),
            genderTextField.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])
         
        // Fitness Goal Label Constraints
        NSLayoutConstraint.activate([
            fitnessGoalLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            fitnessGoalLabel.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: 30)
        ])

        // Fitness Goal Text Field Constraints
        NSLayoutConstraint.activate([
            fitnessGoalTextField.leadingAnchor.constraint(equalTo: fitnessGoalLabel.leadingAnchor),
            fitnessGoalTextField.topAnchor.constraint(equalTo: fitnessGoalLabel.bottomAnchor, constant: 20),
            fitnessGoalTextField.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])
        
        // calculateBMIButton Constraints
        NSLayoutConstraint.activate([
            sendButton.leadingAnchor.constraint(equalTo: fitnessGoalTextField.leadingAnchor),
            sendButton.topAnchor.constraint(equalTo: fitnessGoalTextField.bottomAnchor, constant: 30),
            sendButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])

       

        
    }
}


       
