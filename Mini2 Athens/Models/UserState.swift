//
//  UserState.swift
//  Mini2 Athens
//
//  Created by Nathaniel Andrian on 20/06/21.
//

import Foundation

struct UserState {
    func isNewUser() -> Bool{
        return !UserDefaults.standard.bool(forKey: "newUser")
    }
    
    func setIsNotNewUser(){
        UserDefaults.standard.setValue(true, forKey: "newUser")
    }
    
}
