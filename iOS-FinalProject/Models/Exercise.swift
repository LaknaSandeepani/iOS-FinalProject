//
//  Exercise.swift
//  iOS-FinalProject
//
//  Created by Lakna Attigala on 2023-05-16.
//

import Foundation
struct Exercise: Codable {
    let name: String
    let category: String
    let description: String
    let duration: Int
    let caloriesBurned: Int
    let difficulty: String
    let equipment: String
    let muscleGroups: [String]
    let videoUrl: String
}
