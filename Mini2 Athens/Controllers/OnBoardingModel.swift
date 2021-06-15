//
//  OnBoardingModel.swift
//  Mini2 Athens
//
//  Created by Shofi Rafiiola on 15/06/21.
//

import Foundation
import UIKit

struct OnBoardingModel {

    var images: UIImage
    
}


struct OnBoardingState{
    
    static let shared = OnBoardingState()
    
    func isNewUSer() -> Bool{
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    func setIsNotNewUer(){
        UserDefaults.standard.setValue(true, forKey: "isNewUser")
    }
}
