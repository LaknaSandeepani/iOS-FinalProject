//
//  WorkoutSchedule.swift
//  iOS-FinalProject
//
//  Created by Lakna Attigala on 2023-05-18.
//

import Foundation
struct WorkoutSchedule: Codable {
    let days: [String]
    let times: [String]
    let exercises: [String]
    let repeatSchedule: [String]
}

