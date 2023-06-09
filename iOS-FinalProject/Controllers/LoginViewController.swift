//
//  LoginViewController.swift
//  iOS-FinalProject
//
//  Created by Lakna Attigala on 2023-05-17.

import UIKit

class LoginViewController: UIViewController {
    
  
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Log In"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email Address"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return button
    }()
    
    let registerLabel: UILabel = {
            let label = UILabel()
            label.text = "Don't have an account? Register"
            label.textColor = .gray
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "exercise")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupLoginButton()
        setupRegisterLabel()
    }
    
  
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(loginLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(registerLabel)
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 16),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 32),
            
            registerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16),
            
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 32),
            imageView.widthAnchor.constraint(equalToConstant: 400),
            imageView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    func setupRegisterLabel() {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(registerLabelTapped))
            registerLabel.isUserInteractionEnabled = true
            registerLabel.addGestureRecognizer(tapGesture)
        }
    @objc func registerLabelTapped() {
            let registrationViewController = RegistrationViewController()
            navigationController?.pushViewController(registrationViewController, animated: true)
        }
    
    func setupLoginButton() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }

    @objc func loginButtonTapped() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text else {
            return
            
        }
        
        // Perform login API call
        performLogin(email: email, password: password)
    }

    func performLogin(email: String, password: String) {
    
        let urlString = "http://localhost:8088/login"
        guard let url = URL(string: urlString) else {
            showAlert(title: "Error", message: "Invalid URL")
            return
        }
        
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        // Prepare the request body
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            showAlert(title: "Error", message: "Failed to serialize request body")
            return
        }
        
        // Configure the request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = httpBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Perform the request
        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            // Handle the response and error
            if let error = error {
                self?.showAlert(title: "Error", message: error.localizedDescription)
                return
            }
            
            guard let data = data else {
                self?.showAlert(title: "Error", message: "No data received")
                return
            }
            
            // Parse the response data
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    if let status = json["status"] as? String {
                        if status == "Logged in successfully" {
                            DispatchQueue.main.async {
                                let userDetailsViewController = ViewController()
                                
                                
                                if let navigationController = self?.navigationController {
                                    navigationController.pushViewController(userDetailsViewController, animated: true)
                                } else {
                                    self?.present(userDetailsViewController, animated: true, completion: nil)
                                }
                                self?.clearFields()
                            }
                        } else {
                            self?.showAlert(title: "Error", message: "Login failed")
                        }
                    } else {
                        self?.showAlert(title: "Error", message: "Invalid response")
                    }
                } else {
                    self?.showAlert(title: "Error", message: "Failed to parse response")
                }
            } catch {
                self?.showAlert(title: "Error", message: error.localizedDescription)
            }
        }
        
        task.resume()
    }

    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func clearFields() {
        
        emailTextField.text = ""
        passwordTextField.text = ""
    }

}

