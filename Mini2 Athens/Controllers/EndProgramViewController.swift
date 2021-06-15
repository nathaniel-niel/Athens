//
//  EndProgramViewController.swift
//  Mini2 Athens
//
//  Created by Maurice Tin on 15/06/21.
//

import UIKit

class EndProgramViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func finishClicked(_ sender: UIButton) {
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func reanalyzeClicked(_ sender: Any) {
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
