//
//  ProgramCompletedViewController.swift
//  Mini2 Athens
//
//  Created by Nathaniel Andrian on 11/06/21.
//

import UIKit

class ProgramCompletedViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var finishExerciseButton: UIButton!
    @IBOutlet weak var reAnalyzeMovementButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponent()

        // Do any additional setup after loading the view.
    }
    
    private func setupComponent(){
        backButton.layer.cornerRadius = 20
        cardView.layer.cornerRadius = 45
        finishExerciseButton.layer.cornerRadius = 25
        reAnalyzeMovementButton.layer.borderWidth = 1
        reAnalyzeMovementButton.layer.borderColor = #colorLiteral(red: 1, green: 0.337254902, blue: 0.1019607843, alpha: 1)
        reAnalyzeMovementButton.layer.cornerRadius = 25
    }


    @IBAction func didBackButtonTapped(_ sender: Any) {
    }
    @IBAction func didFinishButtonTapped(_ sender: Any) {
    }
    @IBAction func didReAnalyzebuttonTapped(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
