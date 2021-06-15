//
//  restViewController.swift
//  Mini2 Athens
//
//  Created by vincent meidianto on 09/06/21.
//

import UIKit

class restViewController: UIViewController, RestTimerDelegate {

    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var nextExerciseLabel: UILabel!
    
    @IBOutlet weak var pauseResumeLabel: UILabel!
    
    @IBOutlet weak var exerciseBox: UIView!
    
    var exerciseTimer: ExerciseTimer!
    override func viewWillAppear(_ animated: Bool) {
        exerciseBox.layer.cornerRadius = 20
        exerciseBox.layer.borderWidth = 2
        exerciseBox.layer.borderColor = #colorLiteral(red: 0.1647058824, green: 0.1921568627, blue: 0.1960784314, alpha: 1)
        exerciseBox.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        exerciseBox.layer.shadowRadius = 8
        exerciseBox.layer.shadowOffset = .zero
        exerciseBox.layer.shadowOpacity = 0.3
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        progressLabel.text = "\(currentExerciseIndex+1)/\(exercises.count)"
        
        exerciseTimer = ExerciseTimer(duration: 10, timerLabel: timerLabel)
        
        exerciseTimer?.restDelegate = self
        exerciseTimer?.runTimer()
        nextExerciseLabel.text = exercises[currentExerciseIndex].name
    }
    
    func timesUp() {
         let targetStoryboard = UIStoryboard(name: "StartProgram", bundle: nil)
         let vc = targetStoryboard.instantiateViewController(identifier: "StartProgram")
         navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func pauseClicked(_ sender: UIButton) {
        guard let timerIsRunning = exerciseTimer?.isTimerRunning else {return}
        if timerIsRunning{
            pauseResumeLabel.text = "Resume"
        }else{
            pauseResumeLabel.text = "Pause"
        }
        exerciseTimer?.pauseResumeTimer()
    }
    
    
    @IBAction func doneRestClicked(_ sender: UIButton) {
        exerciseTimer?.finishTimer()
    }
}
