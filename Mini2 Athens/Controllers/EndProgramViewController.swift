//
//  EndProgramViewController.swift
//  Mini2 Athens
//
//  Created by Maurice Tin on 15/06/21.
//

import UIKit

class EndProgramViewController: UIViewController {

    @IBOutlet weak var box: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var primaryButtonLabel: UILabel!
    @IBOutlet weak var secondaryButtonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        box.layer.cornerRadius = 15
        box.layer.masksToBounds = true
        if !setFinished(){
            messageLabel.text = "You completed Set \(currentSet), complete \(pushUpSet-currentSet) more set"
            
            primaryButtonLabel.text = "Continue next set"
            secondaryButtonLabel.text = "Done exercise"
        }else{
            messageLabel.text = "You completed the program."
            
            primaryButtonLabel.text = "Finish Exercise"
            secondaryButtonLabel.text = "Re-analyze movement"
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func primaryClicked(_ sender: UIButton) {
        if !setFinished(){
            currentSet += 1
            currentExerciseIndex = 0
            let sb = UIStoryboard(name: "Rest", bundle: nil)
            let vc = sb.instantiateViewController(identifier: "Rest")
            
            navigationController?.pushViewController(vc, animated: true)
            return
        }
        MusicHelper.sharedHelper.stopBackgroundMusic()
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func secondaryClicked(_ sender: Any) {
        MusicHelper.sharedHelper.stopBackgroundMusic()
        //if done exercise
        if !setFinished(){
            navigationController?.popToRootViewController(animated: true)
        }
        //if reanalyze exercise
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
