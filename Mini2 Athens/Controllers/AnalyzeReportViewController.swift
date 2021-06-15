//
//  AnalyzeReportViewController.swift
//  Mini2 Athens
//
//  Created by vincent meidianto on 09/06/21.
//

import UIKit

class AnalyzeReportViewController: UIViewController {

    @IBOutlet weak var reportBox: UIView!
    @IBOutlet weak var retryButton: UIButton!
    @IBOutlet weak var movementLog: UILabel!
    @IBOutlet weak var analyzeButton: UIButton!
    @IBOutlet weak var exerciseButton: UIButton!
    @IBOutlet weak var movementBox: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        reportBox.layer.cornerRadius = 20
        reportBox.layer.borderWidth = 2
        reportBox.layer.borderColor = #colorLiteral(red: 0.1647058824, green: 0.1921568627, blue: 0.1960784314, alpha: 1)
        reportBox.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        reportBox.layer.shadowRadius = 8
        reportBox.layer.shadowOffset = .zero
        reportBox.layer.shadowOpacity = 0.3
        movementBox.layer.cornerRadius = 20
        movementBox.layer.borderWidth = 2
        movementBox.layer.borderColor = #colorLiteral(red: 0.1647058824, green: 0.1921568627, blue: 0.1960784314, alpha: 1)
        movementBox.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        movementBox.layer.shadowRadius = 8
        movementBox.layer.shadowOffset = .zero
        movementBox.layer.shadowOpacity = 0.3
    }
  
}
