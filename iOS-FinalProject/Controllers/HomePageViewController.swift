
//  HomePageViewController.swift
//  iOS-FinalProject
//
//  Created by Lakna Attigala on 2023-05-15.

import UIKit

class HomePageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UISearchBarDelegate, UIPickerViewDataSource, UIPickerViewDelegate {

    var collectionView: UICollectionView!
    var exercises: [Exercise] = [] // Array to store the fetched exercises
    var filteredExercises: [Exercise] = [] // Array to store the filtered exercises
    let categoryPicker = UIPickerView() // Category dropdown picker
    var selectedCategory: String? // Selected category
    
    let fitnessGoalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "Select a Goal & Experience the Best Matches....."
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a layout for the collection view
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 20

        // Create the collection view
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.register(ExerciseCell.self, forCellWithReuseIdentifier: "Cell")

        // Add the fitness goal label to the view hierarchy
        view.addSubview(fitnessGoalLabel)
        
        // Set constraints for the fitness goal label
        NSLayoutConstraint.activate([
            fitnessGoalLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -20),
            fitnessGoalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            fitnessGoalLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])

        // Create and configure the category picker
        categoryPicker.dataSource = self
        categoryPicker.delegate = self
        categoryPicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(categoryPicker)
        NSLayoutConstraint.activate([
            categoryPicker.topAnchor.constraint(equalTo: fitnessGoalLabel.bottomAnchor, constant: 5),
            categoryPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryPicker.heightAnchor.constraint(equalToConstant: 100)
        ])

        // Add the collection view to the view hierarchy
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: categoryPicker.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // Fetch exercises from the API
        fetchExercises()
    }

    // Function to fetch exercises from the API
    func fetchExercises() {
        guard let selectedCategory = selectedCategory else {
            print("No category selected")
            return
        }
        
        var urlString = "http://localhost:8088/api/exercises?category=\(selectedCategory)"
        
        guard let url = URL(string: urlString) else {
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
                self?.filteredExercises = self?.exercises ?? []

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

   

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredExercises.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? ExerciseCell else {
            fatalError("Unable to dequeue ExerciseCell")
        }

        // Configure the cell with exercise data
        let exercise = filteredExercises[indexPath.item]
        cell.nameLabel.text = exercise.name
        // Fetch the image asynchronously
               if let imageURL = URL(string: exercise.image) {
                   let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
                       if let error = error {
                           print("Failed to fetch image:", error)
                           return
                       }
                       
                       if let data = data, let image = UIImage(data: data) {
                           DispatchQueue.main.async {
                               cell.exerciseImageView.image = image
                           }
                       }
                   }
                   task.resume()
               } else {
                   cell.exerciseImageView.image = UIImage(named: "placeholderImage")
               }
      
        cell.backgroundColor = .lightGray
        cell.layer.cornerRadius = 10
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let exercise = exercises[indexPath.item]

        // Create an instance of ExerciseDetailsViewController
        let exerciseDetailsVC = ExerciseDetailsViewController()

        // Pass the selected exercise data to the details view controller (if needed)
        exerciseDetailsVC.exercise = exercise
        
        // Push the ExerciseDetailsViewController onto the navigation stack
        navigationController?.pushViewController(exerciseDetailsVC, animated: true)
    }

 

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // Return the number of categories available
        return category.count
    }

   

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // Return the title for each row in the picker
        return category[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Update the selected category and fetch exercises
        selectedCategory = category[row]
        fetchExercises()
    }

    

    let category = ["MuscleBuilding", "WeightLoss"]
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 350
        let height = 150 
        return CGSize(width: width, height: height)
    }

}

