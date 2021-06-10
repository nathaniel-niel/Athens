//
//  ExerciseProgram.swift
//  Mini2 Athens
//
//  Created by Rostadhi Akbar, M.Pd on 10/06/21.
//

import Foundation
import UIKit

enum ExerciseType: String, CaseIterable {
    case exercise = "Exerise"
    
    func getColor() -> UIColor? {
        switch self {
        case .exercise:
            return UIColor(named: "Background Color")
        }
    }
    
    func getImage() -> UIImage {
        switch self {
        case .exercise:
            return #imageLiteral(resourceName: "james-barr-7U0yuZcS5yA-unsplash")
       
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
