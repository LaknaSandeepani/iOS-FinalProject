
//  HomePageViewController.swift
//  iOS-FinalProject
//
//  Created by Lakna Attigala on 2023-05-15.
//

import UIKit

class HomePageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var collectionView: UICollectionView!
    var exercises: [Exercise] = [] // Array to store the fetched exercises

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a layout for the collection view
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 20

        // Create the collection view
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemGray
        collectionView.register(ExerciseCell.self, forCellWithReuseIdentifier: "Cell")


        // Add the collection view to the view hierarchy
        view.addSubview(collectionView)

        // Fetch exercises from the API
        fetchExercises()
    }

    // Function to fetch exercises from the API
    func fetchExercises() {
        guard let url = URL(string: "http://localhost:8088/api/exercises") else {
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
                self?.exercises = try decoder.decode([Exercise].self, from: data)

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
        return exercises.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? ExerciseCell else {
            fatalError("Unable to dequeue ExerciseCell")
        }

        // Configure the cell with exercise data
        let exercise = exercises[indexPath.item]
        cell.nameLabel.text = exercise.name

        // Customize the cell's appearance based on exercise data

        return cell
    }

    
}
