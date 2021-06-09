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
        reportBox.layer.cornerRadius = 30
        reportBox.layer.borderWidth = 2
        reportBox.layer.borderColor = UIColor.black.cgColor
        movementBox.layer.cornerRadius = 30
        movementBox.layer.borderWidth = 2
        movementBox.layer.borderColor = UIColor.black.cgColor
    }
  
}
