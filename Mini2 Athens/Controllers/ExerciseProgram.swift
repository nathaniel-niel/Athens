//
//  ExerciseProgram.swift
//  Mini2 Athens
//
//  Created by Rostadhi Akbar, M.Pd on 10/06/21.
//

import Foundation
import UIKit

enum ExerciseType: String, CaseIterable {
    case pushUps = "Exercise1"
    case tableTop = "Exercise2"
    case incline = "Exercise3"
    case wall = "Exercise4"
    case knee = "Exercise5"
    case half = "Exercise6"
    
    func getColor() -> UIColor? {
        switch self {
        case .pushUps:
            return UIColor(named: "Background Color")
        case .tableTop:
            return UIColor(named: "Background Color")
        case .incline:
            return UIColor(named: "Background Color")
        case .wall:
            return UIColor(named: "Background Color")
        case .knee:
            return UIColor(named: "Background Color")
        case .half:
            return UIColor(named: "Background Color")
        }
    }
    
    func getImage() -> UIImage {
        switch self {
        case .pushUps:
            return #imageLiteral(resourceName: "1")
        case .tableTop:
            return #imageLiteral(resourceName: "2")
        case .incline:
            return #imageLiteral(resourceName: "3")
        case .wall:
            return #imageLiteral(resourceName: "4")
        case .knee:
            return #imageLiteral(resourceName: "5")
        case .half:
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
    Exercise(name: "Negative", age: 1, type: .pushUps),
    Exercise(name: "TableTop", age: 1, type: .tableTop),
    Exercise(name: "Incline", age: 1, type: .incline),
    Exercise(name: "Wall", age: 1, type: .wall),
    Exercise(name: "Knee", age: 1, type: .knee),
    Exercise(name: "Half", age: 1, type: .half),
]

let pushUpDescription = "10 minutes | No equipment | 3 Sets"
let pushUpSet = 3
