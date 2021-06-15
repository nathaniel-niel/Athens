//
//  restViewController.swift
//  Mini2 Athens
//
//  Created by vincent meidianto on 09/06/21.
//

import UIKit

class restViewController: UIViewController {
    @IBOutlet weak var exerciseBox: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        exerciseBox.layer.cornerRadius = 20
        exerciseBox.layer.borderWidth = 2
        exerciseBox.layer.borderColor = #colorLiteral(red: 0.1647058824, green: 0.1921568627, blue: 0.1960784314, alpha: 1)
        exerciseBox.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        exerciseBox.layer.shadowRadius = 8
        exerciseBox.layer.shadowOffset = .zero
        exerciseBox.layer.shadowOpacity = 0.3
    }
}
