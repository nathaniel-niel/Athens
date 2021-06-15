//
//  Functionality.swift
//  Mini2 Athens
//
//  Created by Nathaniel Andrian on 14/06/21.
//

import Foundation

class Functionality{
    
    let data = DataManipulation()
    
    //function to get current date
    func getCurrentDateTime() -> String{
        let currentDate =  Date()
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

}
