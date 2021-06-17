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
            
            primaryButtonLabel.text = "Finish Exercise"
            secondaryButtonLabel.text = "Re-analyze movement"
        }else{
            messageLabel.text = "You completed the program."
            primaryButtonLabel.text = "Continue next set"
            secondaryButtonLabel.text = "Done exercise"
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func primaryClicked(_ sender: UIButton) {
        if !setFinished(){
            currentSet += 1
            currentExerciseIndex = 0
            guard let vc = storyboard?.instantiateViewController(identifier: "StartProgram") else { return }
            
            navigationController?.pushViewController(vc, animated: true)
            return
        }
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func secondaryClicked(_ sender: Any) {
        if !setFinished(){
            navigationController?.popToRootViewController(animated: true)
        }
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
