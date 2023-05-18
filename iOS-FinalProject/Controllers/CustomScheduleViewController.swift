//
//  CustomScheduleViewController.swift
//  iOS-FinalProject
//
//  Created by Lakna Attigala on 2023-05-17.
//

import UIKit

class CustomScheduleViewController: UIViewController {
    
    private var workoutDays: [String] = []
    private var workoutTimes: [String] = []
    private var selectedExercises: [String] = []
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Custom Schedule"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let daysLabel: UILabel = {
        let label = UILabel()
        label.text = "Workout Days:"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timesLabel: UILabel = {
        let label = UILabel()
        label.text = "Workout Times:"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let exercisesLabel: UILabel = {
        let label = UILabel()
        label.text = "Selected Exercises:"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repeatLabel: UILabel = {
        let label = UILabel()
        label.text = "Repeat Schedule:"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let daysPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()
    
    private let timesPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()

    private let exercisesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let repeatSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Daily", "Weekly", "Custom"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()

    
    private let saveButton: UIButton = {
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
    
    private func configureUI() {
        view.backgroundColor = .white
        
        // Add title label
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
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
    
    class WorkoutSchedule {
        var days: [String]
        var times: [String]
        var duration: String?
        var exercises: [String]
        var repeatSchedule: Int
        var restDays: String?
        
        init(days: [String], times: [String], exercises: [String], repeatSchedule: Int) {
            self.days = days
            self.times = times
            self.exercises = exercises
            self.repeatSchedule = repeatSchedule
        }
    }

    private func registerTableViewCells() {
        exercisesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "ExerciseCell")
    }
    
    @objc private func saveButtonTapped() {
        // Save the selected workout days, times, duration, selected exercises, repeat schedule, and rest days
        let workoutSchedule = WorkoutSchedule(
            days: workoutDays,
            times: workoutTimes,
            exercises: selectedExercises,
            repeatSchedule: repeatSegmentedControl.selectedSegmentIndex
        )
        
        // Handle the saving of workout schedule data
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
            workoutDays.append(selectedDay)
        } else {
            let selectedTime = "\(row):00"
            workoutTimes.append(selectedTime)
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
        selectedExercises.append(selectedExercise)
    }
}
