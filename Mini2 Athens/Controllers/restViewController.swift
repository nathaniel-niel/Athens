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
    
    
    var exerciseTimer: ExerciseTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressLabel.text = "\(currentExerciseIndex+1)/\(exercises.count)"
        
        exerciseTimer = ExerciseTimer(duration: 10, timerLabel: timerLabel)
        
        exerciseTimer?.restDelegate = self
        exerciseTimer?.runTimer()
        nextExerciseLabel.text = exercises[currentExerciseIndex].name
    }
    
    func timesUp() {
        currentExerciseIndex += 1
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
