//
//  ViewCustomScheduleController.swift
//  iOS-FinalProject
//
//  Created by Lakna Attigala on 2023-05-18.

import UIKit

class ViewCustomScheduleController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var collectionView: UICollectionView!
    var workoutSchedules: [WorkoutSchedule] = [] // Array to store the fetched exercises

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a layout for the collection view
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10

        // Create the collection view
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.register(ScheduleView.self, forCellWithReuseIdentifier: "Cell")

        // Add the collection view to the view hierarchy
        view.addSubview(collectionView)

        // Fetch exercises from the API
        fetchSchedules()
    }

    // Function to fetch exercises from the API
    func fetchSchedules() {
        guard let url = URL(string: "http://localhost:8088/viewschedule") else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if let error = error {
                print("Request error:", error)
                return
            }

            guard let data = data else {
                print("No response data")
                return
            }

            // Parse the response data
            do {
                let decoder = JSONDecoder()
                self?.workoutSchedules = try decoder.decode([WorkoutSchedule].self, from: data)

                // Reload the collection view on the main thread
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            } catch {
                print("Failed to parse response data:", error)
            }
        }

        task.resume()
    }

    // MARK: UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workoutSchedules.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? ScheduleView else {
            fatalError("Unable to dequeue ScheduleView cell")
        }

        // Configure the cell with workout schedule data
        let workoutSchedule = workoutSchedules[indexPath.item]
        cell.daysLabel.text = "Day: \(workoutSchedule.days.joined(separator: ", "))"
        cell.timeLabel.text = "Time: \(workoutSchedule.times.joined(separator: ", "))"
        cell.exercisesLabel.text = "Exercise: \(workoutSchedule.exercises.joined(separator: ", "))"
        cell.repeatScheduleLabel.text = "Repeat Schedule: \(workoutSchedule.repeatSchedule.joined(separator: ", "))"



        // Customize the cell's appearance based on workout schedule data
        cell.backgroundColor = .lightGray
        cell.layer.cornerRadius = 10

        return cell
    }

   

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 20
        let height = collectionView.bounds.height - 700
        return CGSize(width: width, height: height)
    }


    
}

