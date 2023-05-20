//
//  CustomScheduleViewController.swift
//  iOS-FinalProject
//
//  Created by Lakna Attigala on 2023-05-17.
//

import UIKit

class CustomScheduleViewController: UIViewController {
    
    var workoutDays: [String] = []
    var workoutTimes: [String] = []
    var selectedExercises: [String] = []
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Custom Schedule"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let daysLabel: UILabel = {
        let label = UILabel()
        label.text = "Workout Days:"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timesLabel: UILabel = {
        let label = UILabel()
        label.text = "Workout Times:"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let exercisesLabel: UILabel = {
        let label = UILabel()
        label.text = "Selected Exercises:"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let repeatLabel: UILabel = {
        let label = UILabel()
        label.text = "Repeat Schedule:"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let daysPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()
    
    let timesPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()

    let exercisesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let repeatSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Daily", "Weekly", "Custom"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()

    
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save Schedule", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        registerTableViewCells()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        
        // Add title label
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // Add days label
        view.addSubview(daysLabel)
        NSLayoutConstraint.activate([
            daysLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            daysLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        // Add days picker view
        view.addSubview(daysPickerView)
        NSLayoutConstraint.activate([
            daysPickerView.topAnchor.constraint(equalTo: daysLabel.bottomAnchor, constant: 10),
            daysPickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            daysPickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            daysPickerView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // Add times label
        view.addSubview(timesLabel)
        NSLayoutConstraint.activate([
            timesLabel.topAnchor.constraint(equalTo: daysPickerView.bottomAnchor, constant: 20),
            timesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        // Add times picker view
        view.addSubview(timesPickerView)
        NSLayoutConstraint.activate([
            timesPickerView.topAnchor.constraint(equalTo: timesLabel.bottomAnchor, constant: 10),
            timesPickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            timesPickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            timesPickerView.heightAnchor.constraint(equalToConstant: 100)
        ])

        // Add exercises label
        view.addSubview(exercisesLabel)
        NSLayoutConstraint.activate([
            exercisesLabel.topAnchor.constraint(equalTo: timesPickerView.bottomAnchor, constant: 20),
            exercisesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        // Add exercises table view
        view.addSubview(exercisesTableView)
        NSLayoutConstraint.activate([
            exercisesTableView.topAnchor.constraint(equalTo: exercisesLabel.bottomAnchor, constant: 10),
            exercisesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            exercisesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            exercisesTableView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // Add repeat label
        view.addSubview(repeatLabel)
        NSLayoutConstraint.activate([
            repeatLabel.topAnchor.constraint(equalTo: exercisesTableView.bottomAnchor, constant: 40),
            repeatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        // Add repeat segmented control
        view.addSubview(repeatSegmentedControl)
        NSLayoutConstraint.activate([
            repeatSegmentedControl.topAnchor.constraint(equalTo: repeatLabel.bottomAnchor, constant: 10),
            repeatSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            repeatSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        
        // Add save button
        view.addSubview(saveButton)
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.topAnchor.constraint(equalTo: repeatSegmentedControl.bottomAnchor, constant: 40)
        ])
        
        daysPickerView.dataSource = self
        daysPickerView.delegate = self
        
        timesPickerView.dataSource = self
        timesPickerView.delegate = self
        
        exercisesTableView.dataSource = self
        exercisesTableView.delegate = self
    }
    

    func registerTableViewCells() {
        exercisesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "ExerciseCell")
    }
    struct WorkoutSchedule: Encodable {
        var days: [String]
        var times: [String]
        var exercises: [String]
        var repeatSchedule: String
        
        
        enum CodingKeys: String, CodingKey {
            case days
            case times
            case exercises
            case repeatSchedule
            
        }
        
        func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(days, forKey: .days)
                    try container.encodeIfPresent(times, forKey: .times)
                    try container.encodeIfPresent(exercises, forKey: .exercises)
                    try container.encode(repeatSchedule, forKey: .repeatSchedule)
                }
    }

    @objc func saveButtonTapped() {
        // Validate the selected options
        guard !workoutDays.isEmpty else {
            showAlertOnMainThread(message: "Please select at least one workout day.")
            return
        }
        
        guard !workoutTimes.isEmpty else {
            showAlertOnMainThread(message: "Please select at least one workout time.")
            return
        }
        
        guard !selectedExercises.isEmpty else {
            showAlertOnMainThread(message: "Please select at least one exercise.")
            return
        }
        
        
        // Save the selected workout days, times, duration, selected exercises, repeat schedule, and rest days
        
        let repeatOptions = ["Daily", "Weekly", "Custom"]
        let repeatSchedule = repeatOptions[repeatSegmentedControl.selectedSegmentIndex]
        let workoutSchedule = WorkoutSchedule(
            days: workoutDays,
            times: workoutTimes,
            exercises: selectedExercises,
            repeatSchedule: repeatSchedule
        )
        
        // Create the URL for the API endpoint
        guard let url = URL(string: "http://localhost:8088/api/workoutschedule") else {
            showAlertOnMainThread(message: "Invalid URL")
            return
        }
        
        // Create the request object
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            // Convert workoutSchedule to JSON data
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let jsonData = try encoder.encode(workoutSchedule)
            request.httpBody = jsonData
            
            // Create a data task to send the request
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    self.showAlertOnMainThread(message: "Error: \(error)")
                } else if let response = response as? HTTPURLResponse {
                    if response.statusCode == 200 {
                        self.showAlertOnMainThread(message: "Workout schedule saved successfully.")
                    } else {
                        self.showAlertOnMainThread(message: "Error: HTTP status code \(response.statusCode)")
                    }
                }
            }
            
            // Start the data task
            task.resume()
            
        } catch {
            showAlertOnMainThread(message: "Error encoding workout schedule: \(error)")
        }
    }

    func showAlertOnMainThread(message: String) {
        DispatchQueue.main.async {
            self.showAlert(message: message)
        }
    }

    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }


}

extension CustomScheduleViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == daysPickerView {
            return 7 // 7 days in a week
        } else {
            return 24 // 24 hours in a day
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == daysPickerView {
            let daysOfWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
            return daysOfWeek[row]
        } else {
            return "\(row):00" // Display hours in HH:00 format
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            if pickerView == daysPickerView {
                let daysOfWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
                let selectedDay = daysOfWeek[row]
                workoutDays = [selectedDay]
            } else {
                let selectedTime = "\(row):00"
                workoutTimes = [selectedTime]
            }
        }
    
    
}

extension CustomScheduleViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath)
        
        let exerciseNames = [
            "Squat",
            "Jumping Jacks",
            "Burpees",
            "Mountain Climbers",
            "High Knees",
            "Barbell Bench Press",
            "Deadlift",
            "Dumbbell Shoulder Press"
        ]
        
        cell.textLabel?.text = exerciseNames[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let exerciseNames = [
            "Squat",
            "Jumping Jacks",
            "Burpees",
            "Mountain Climbers",
            "High Knees",
            "Barbell Bench Press",
            "Deadlift",
            "Dumbbell Shoulder Press"
        ]
        
        let selectedExercise = exerciseNames[indexPath.row]
        selectedExercises = [selectedExercise]
    }
}
