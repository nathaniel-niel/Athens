//
//  SuggestedWorkout.swift
//  Mini2 Athens
//
//  Created by Maurice Tin on 08/06/21.
//

import Foundation
import UIKit


struct SuggestedWorkout {
    var name: String?
    //dalam detik
    var duration: Int?
    var icon: UIImage?
    
    init(name: String?, duration: Int?, icon: UIImage?) {
        self.name = name
        self.duration = duration
        self.icon = icon
    }
}
