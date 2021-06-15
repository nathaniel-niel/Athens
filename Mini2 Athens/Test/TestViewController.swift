//
//  TestViewController.swift
//  Mini2 Athens
//
//  Created by Nathaniel Andrian on 11/06/21.
//

import UIKit

class TestViewController: UIViewController {
    
    let manipulate = DataManipulation()
    let functional = Functionality()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    

    private func setup(){
        manipulate.createNewData(dataIndex: 0, contentIconName: "MovementIcon-1", movementName: "Push-Up", movmentAccuracy: "Your accuracy 60%", analyzeDate: functional.getCurrentDateTime())
        manipulate.createNewData(dataIndex: 1, contentIconName: "MovementIcon-1", movementName: "Plank", movmentAccuracy: "Your accuracy 70%", analyzeDate: functional.getCurrentDateTime())
        manipulate.createNewData(dataIndex: 2, contentIconName: "MovementIcon-1", movementName: "Push-Up", movmentAccuracy: "Your accuracy 30%", analyzeDate: functional.getCurrentDateTime())
        manipulate.retrieveData()
        //functional.dataChecker()
    }

    @IBAction func tapButton(_ sender: Any) {
//        let vc = storyboard?.instantiateViewController(identifier: "history") as! MyHistoryViewController
//        self.navigationController?.pushViewController(vc, animated: true)
       
        
        
    }





    @IBAction func didTapped(_ sender: UIButton) {
        let vc = MovementTutorialViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
