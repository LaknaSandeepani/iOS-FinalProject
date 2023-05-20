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
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let remindButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Remind Me", for: .normal)
            button.backgroundColor = .white
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
        contentView.addSubview(remindButton)
        
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
        deleteButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        deleteButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        remindButton.translatesAutoresizingMaskIntoConstraints = false
        remindButton.topAnchor.constraint(equalTo: deleteButton.bottomAnchor, constant: 10).isActive = true
        remindButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        remindButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        remindButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        remindButton.addTarget(self, action: #selector(remindButtonTapped), for: .touchUpInside)
            
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func deleteButtonTapped() {
        guard let scheduleID = scheduleID else {
            // Handle the scenario where the schedule ID is not available
            return
        }
        
        let urlString = "http://localhost:8088/deleteschedule"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestBody: [String: Any] = [
            "_id": scheduleID
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestBody, options: [])
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Request error:", error)
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    print("Invalid response")
                    return
                }
                
                if httpResponse.statusCode == 200 {
                    // Schedule deletion was successful
                    DispatchQueue.main.async {
                        self.showAlert(title: "Success", message: "Schedule deleted successfully.")
                    }
                } else {
                    // Schedule deletion failed
                    DispatchQueue.main.async {
                        self.showAlert(title: "Error", message: "Failed to delete schedule.")
                    }
                }
            }
            
            task.resume()
        } catch {
            print("Error encoding request body:", error)
        }
    }
    @objc func remindButtonTapped() {
          
       }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        // Find the top-most view controller to present the alert
        if let topViewController = UIApplication.shared.keyWindow?.rootViewController {
            topViewController.present(alertController, animated: true, completion: nil)
        }
    }
}
