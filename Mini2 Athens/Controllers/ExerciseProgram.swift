//
//  ExerciseProgram.swift
//  Mini2 Athens
//
//  Created by Rostadhi Akbar, M.Pd on 10/06/21.
//

import Foundation
import UIKit

enum ExerciseType: String, CaseIterable {
    case exercise1 = "Exercise1"
    case exercise2 = "Exercise2"
    case exercise3 = "Exercise3"
    case exercise4 = "Exercise4"
    case exercise5 = "Exercise5"
    case exercise6 = "Exercise6"
    
    func getColor() -> UIColor? {
        switch self {
        case .exercise1:
            return UIColor(named: "Background Color")
        case .exercise2:
            return UIColor(named: "Background Color")
        case .exercise3:
            return UIColor(named: "Background Color")
        case .exercise4:
            return UIColor(named: "Background Color")
        case .exercise5:
            return UIColor(named: "Background Color")
        case .exercise6:
            return UIColor(named: "Background Color")
        }
    }
    
    func getImage() -> UIImage {
        switch self {
        case .exercise1:
            return #imageLiteral(resourceName: "1")
        case .exercise2:
            return #imageLiteral(resourceName: "2")
        case .exercise3:
            return #imageLiteral(resourceName: "3")
        case .exercise4:
            return #imageLiteral(resourceName: "4")
        case .exercise5:
            return #imageLiteral(resourceName: "5")
        case .exercise6:
            return #imageLiteral(resourceName: "6")
        }
    }
}
class Exercise {
    let id: String = UUID().uuidString
    var name: String?
    var age: Int?
    var description: String?
    var type: ExerciseType?
    var isFavorite: Bool
    
    init(name: String?, age: Int?, description: String? = nil, type: ExerciseType) {
        self.name = name
        self.description = description
        self.age = age
        self.type = type
        self.isFavorite = false
    }
}

var currentExerciseIndex = 0
let currentSet = 1

let exercises = [
    Exercise(name: "Negative", age: 1, type: .exercise1),
    Exercise(name: "TableTop", age: 1, type: .exercise2),
    Exercise(name: "Incline", age: 1, type: .exercise3),
    Exercise(name: "Wall", age: 1, type: .exercise4),
    Exercise(name: "Knee", age: 1, type: .exercise5),
    Exercise(name: "Half", age: 1, type: .exercise6),
]

let pushUpDescription = "10 minutes | No equipment | 3 Sets"
let pushUpSet = 3
