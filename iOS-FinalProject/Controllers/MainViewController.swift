//
//  MainViewController.swift
//  iOS-FinalProject
//
//  Created by Lakna Attigala on 2023-05-11.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set background color
        view.backgroundColor = .black
        
        // Add a "Workout Planner" label
        let workoutLabel = UILabel()
        workoutLabel.text = "FITNESS PLANNER"
        workoutLabel.textColor = .white
        workoutLabel.font = UIFont.systemFont(ofSize: 15)
        workoutLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(workoutLabel)

        // Add a "Volume Up Your" label
        let volumeLabel = UILabel()
        volumeLabel.text = "VOLUME UP YOUR"
        volumeLabel.textColor = .white
        volumeLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        volumeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(volumeLabel)

        // Add a "Body Goals" label
        let bodyLabel = UILabel()
        bodyLabel.text = "BODY GOALS"
        bodyLabel.textColor = .white
        bodyLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bodyLabel)

        // Center the labels horizontally and vertically
        NSLayoutConstraint.activate([
            workoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            workoutLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -300),
            volumeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            volumeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -220),
            bodyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bodyLabel.topAnchor.constraint(equalTo: volumeLabel.bottomAnchor)
        ])
        
        // Create a UIImageView to display the splash image
        let splashImageView = UIImageView(image: UIImage(named: "mainscreen"))
        splashImageView.contentMode = .scaleAspectFit
        splashImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(splashImageView)
        
        // Center the image view horizontally and vertically
        NSLayoutConstraint.activate([
            splashImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            splashImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40),
            splashImageView.widthAnchor.constraint(equalToConstant: 400),
            splashImageView.heightAnchor.constraint(equalToConstant: 400)
        ])
        
        // Add a "Start building your body" button
        let startButton = UIButton(type: .system)
        startButton.setTitle("START BUILDING YOUR BODY", for: .normal)
        startButton.setTitleColor(.black, for: .normal)
        startButton.backgroundColor = .yellow
        startButton.layer.cornerRadius = 10
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startButton)
        
        // Set the width and height of the button
        NSLayoutConstraint.activate([
            startButton.widthAnchor.constraint(equalToConstant: 250),
            startButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Center the button below the image view
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.topAnchor.constraint(equalTo: splashImageView.bottomAnchor, constant: 16)
        ])
        
        // Add a label to describe the purpose of the application
            let descriptionLabel = UILabel()
            descriptionLabel.text = "This application improve yourself to have a healthy lifestyle by exercising"
            descriptionLabel.textColor = .white
            descriptionLabel.textAlignment = .center
            descriptionLabel.numberOfLines = 0
            descriptionLabel.font = UIFont.systemFont(ofSize: 15)
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(descriptionLabel)
            
            // Position the label above the button
            NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -16),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            ])
            
        
//        // Add a "Don't have an account? Register" label
        let registerLabel = UILabel()
        registerLabel.text = "Don't have any account? Register"
        registerLabel.textColor = .white
        registerLabel.font = UIFont.systemFont(ofSize: 15)
        registerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerLabel)

        // Set the color of "Register" to yellow
        let attributedString = NSMutableAttributedString(string: registerLabel.text!)
        let range = (registerLabel.text! as NSString).range(of: "Register")
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.yellow, range: range)
        registerLabel.attributedText = attributedString
        
        // Add tap gesture recognizer to the registerLabel
        registerLabel.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(registerLabelTapped))
        registerLabel.addGestureRecognizer(tapGestureRecognizer)

        // Center the label horizontally and position it below the button
        NSLayoutConstraint.activate([
            registerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerLabel.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 16)
        ])

    }
    
    @objc func startButtonTapped() {
        let loginViewController = LoginViewController() // Instantiate LoginViewController using its initializer
        
        if let navigationController = navigationController {
            navigationController.pushViewController(loginViewController, animated: true)
        } else {
            let navController = UINavigationController(rootViewController: loginViewController)
            navController.modalPresentationStyle = .fullScreen
            present(navController, animated: true, completion: nil)
        }
    }

    
    // Action method for the tap gesture recognizer
    @objc func registerLabelTapped() {
        let registerViewController = RegistrationViewController() // Instantiate RegisterViewController using its initializer
        
        if let navigationController = navigationController {
            navigationController.pushViewController(registerViewController, animated: true)
        } else {
            present(registerViewController, animated: true, completion: nil)
        }
    }


    

  

}
