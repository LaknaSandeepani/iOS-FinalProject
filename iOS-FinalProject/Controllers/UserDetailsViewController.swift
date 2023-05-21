//
//  UserDetailsViewController.swift
//  iOS-FinalProject
//
//  Created by Lakna Attigala on 2023-05-12.

import UIKit

class UserDetailsViewController: UIViewController,UITabBarControllerDelegate {
    let tabBar = UITabBarController()
 
    let detailsLabel: UILabel = {
        let label = UILabel()
        label.text = "User Details Capture"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let heightLabel: UILabel = {
        let label = UILabel()
        label.text = "Height (cm)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let heightTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.text = "Weight (kg)"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let weightTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Age"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let ageTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Gender"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let genderTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let fitnessGoalLabel: UILabel = {
        let label = UILabel()
        label.text = "Fitness Goal"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let fitnessGoalTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate BMI & Know Your Fitness Plan", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return button
    }()
    
    let bmiLabel: UILabel = {
        let label = UILabel()
        label.text = "Your BMI is: "
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
   
                
        setupViews()
        setupConstraints()
    }
    
    
    
    func setupViews() {
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
        view.addSubview(bmiLabel)
        sendButton.addTarget(self, action: #selector(calculateBMI), for: .touchUpInside)

        
    }
    
    func setupConstraints() {
        let margins = view.layoutMarginsGuide
        
        // Details Label Constraints
        NSLayoutConstraint.activate([
            detailsLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            detailsLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: -20)
        ])

        // Height Label Constraints
        NSLayoutConstraint.activate([
            heightLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            heightLabel.topAnchor.constraint(equalTo: detailsLabel.topAnchor, constant: 50)
        ])

        // Height Text Field Constraints
        NSLayoutConstraint.activate([
            heightTextField.leadingAnchor.constraint(equalTo: heightLabel.leadingAnchor),
            heightTextField.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 10),
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
            weightTextField.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 10),
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
            ageTextField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 10),
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
            genderTextField.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 10),
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
            fitnessGoalTextField.topAnchor.constraint(equalTo: fitnessGoalLabel.bottomAnchor, constant: 10),
            fitnessGoalTextField.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])
        
        // calculateBMIButton Constraints
        NSLayoutConstraint.activate([
            sendButton.leadingAnchor.constraint(equalTo: fitnessGoalTextField.leadingAnchor),
            sendButton.topAnchor.constraint(equalTo: fitnessGoalTextField.bottomAnchor, constant: 30),
            sendButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])


        // BMI Lable Constraints
        NSLayoutConstraint.activate([
            bmiLabel.topAnchor.constraint(equalTo: sendButton.bottomAnchor, constant: 10),
            bmiLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            bmiLabel.leadingAnchor.constraint(greaterThanOrEqualTo: margins.leadingAnchor),
            bmiLabel.trailingAnchor.constraint(lessThanOrEqualTo: margins.trailingAnchor)
        ])

       
        
    }
    

    @objc func calculateBMI() {
        guard let heightText = heightTextField.text,
              !heightText.isEmpty,
              let height = Double(heightText),
              let weightText = weightTextField.text,
              !weightText.isEmpty,
              let weight = Double(weightText) else {
            showErrorAlert(message: "Please enter valid height and weight")
            return
        }
        
        guard let ageText = ageTextField.text,
              !ageText.isEmpty,
              let age = Int(ageText) else {
            showErrorAlert(message: "Please enter valid age")
            return
        }
        
        guard let gender = genderTextField.text,
              !gender.isEmpty else {
            showErrorAlert(message: "Please enter gender")
            return
        }
        
        guard let goal = fitnessGoalTextField.text,
              !goal.isEmpty else {
            showErrorAlert(message: "Please enter fitness goal")
            return
        }

        let heightInMeters = height / 100.0
        let bmi = weight / (heightInMeters * heightInMeters)

        // Create the request URL
        guard let url = URL(string: "http://localhost:8088/api/save-bmi") else {
            showErrorAlert(message: "Invalid URL")
            return
        }
        
        // Create the request body
        let requestBody: [String: Any] = [
            "age": age,
            "gender": gender,
            "height": height,
            "weight": weight,
            "bmi": bmi,
            "goal": goal
        ]
        
        // Convert the request body to JSON data
        guard let jsonData = try? JSONSerialization.data(withJSONObject: requestBody) else {
            showErrorAlert(message: "Failed to serialize JSON data")
            return
        }
        
        // Create the HTTP request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // Send the HTTP request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Request error:", error)
                return
            }

            guard let data = data else {
                print("No response data")
                return
            }

            // Handle the response data
            if let responseString = String(data: data, encoding: .utf8) {
                print("Response:", responseString)
            }
        }

        task.resume()

        let formattedBMI = String(format: "%.2f", bmi)
        bmiLabel.text = String(format: "Your BMI is: %.1f", bmi)

        // Suggest a fitness plan based on BMI value
        var plan: String
        if bmi < 18.5 {
            bmiLabel.textColor = UIColor.blue
            bmiLabel.text = "Underweight (\(formattedBMI))"
            plan = "You are underweight. You can improve your BMI by increasing your calorie intake and doing muscle-building exercises. Good to follow Muscle Building Plans"
        } else if bmi < 25 {
            bmiLabel.textColor = UIColor.green
            bmiLabel.text = "Normal weight (\(formattedBMI))"
            plan = "You are at a healthy weight. Keep it up by eating a balanced diet and staying active. Good to follow Muscle Building Plans"
        } else if bmi < 30 {
            bmiLabel.textColor = UIColor.orange
            bmiLabel.text = "Overweight (\(formattedBMI))"
            plan = "You are overweight. You can improve your BMI by reducing your calorie intake, increasing your physical activity, and doing cardiovascular exercises. Good to follow Weight Loss Plans"
        } else {
            bmiLabel.textColor = UIColor.red
            bmiLabel.text = "Obese (\(formattedBMI))"
            plan = "You are obese. You can improve your BMI by reducing your calorie intake, increasing your physical activity, and doing both cardiovascular and strength-training exercises. Good to follow Weight Loss Plans"
        }

        // Display the user's BMI and suggested fitness plan in an alert
        let alert = UIAlertController(title: "Your BMI", message: "Your BMI is \(formattedBMI)\n\n\(plan)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            // Clear the text fields after dismissing the alert
            self.heightTextField.text = ""
            self.weightTextField.text = ""
            self.ageTextField.text = ""
            self.genderTextField.text = ""
            self.fitnessGoalTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    
    }



       
