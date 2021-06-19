//
//  Functionality.swift
//  Mini2 Athens
//
//  Created by Nathaniel Andrian on 14/06/21.
//

import Foundation
import UIKit

class Functionality{
    
    let data = DataManipulation()
    
    //function to convert date to string
    func convertDateToString(currentDate: Date) -> String{
//        let currentDate =  Date()
        let format = DateFormatter()
        format.dateStyle = .medium
        format.timeStyle = .none
        let currentDateTime = format.string(from: currentDate)
        return currentDateTime
    }
    
    //function to check core data is empty or not
    func dataIsEmpty() -> Bool{
        data.retrieveData()
        if data.model.count == 0{
            return true
        }
        else{
            return false
        }
    }
    
    func back(vc: UIViewController){
        vc.navigationController?.popViewController(animated: true)
    }

}
