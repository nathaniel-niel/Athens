//
//  ExerciseProgram.swift
//  Mini2 Athens
//
//  Created by Rostadhi Akbar, M.Pd on 10/06/21.
//

import Foundation
import UIKit

enum ExerciseType: String, CaseIterable {
    case pushUps = "Negative Push-Up"
    case tableTop = "Table Top Push-Up"
    case incline = "Incline Push-Up"
    case wall = "Wall Push-Up"
    case knee = "Knee Push-Up"
    case kneeWithKnuckles = "Knee Push-Up with Knuckles."
    case half = "Half Push-Up"
    
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
        case .kneeWithKnuckles:
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
        case .kneeWithKnuckles:
            return #imageLiteral(resourceName: "4")
        }
    }
    
    func getDuration() -> Int{
        switch self {
        case .half:
            return 30
        case .pushUps:
            return 30
        case .wall:
            return 30
        case .incline:
            return 60
        case .knee:
            return 30
        case .kneeWithKnuckles:
            return 60
        case .tableTop:
            return 45
        }
    }
        
    func getVolume() -> Int{
        switch self {
        case .half:
            return 8
        case .pushUps:
            return 8
        case .wall:
            return 12
        case .incline:
            return 8
        case .knee:
            return 10
        case .kneeWithKnuckles:
            return 12
        case .tableTop:
            return 12
        }
    }
}
class Exercise {
    let id: String = UUID().uuidString
    var name: String?
    var description: String?
    var type: ExerciseType?
    
    init(name: String?, description: String? = nil, type: ExerciseType) {
        self.name = name
        self.description = description
        self.type = type
    }
}

var currentExerciseIndex = 0
var currentSet = 1

let exercises = [
    Exercise(name: "Negative", type: .pushUps),
    Exercise(name: "TableTop", type: .tableTop),
    Exercise(name: "Incline", type: .incline),
    Exercise(name: "Wall", type: .wall),
    Exercise(name: "Knee", type: .knee),
    Exercise(name: "Half", type: .half),
]

let pushUpDescription = "10 minutes | No equipment | 3 Sets"
var pushUpSet = 3

func setFinished() -> Bool {
    return currentSet == pushUpSet
}