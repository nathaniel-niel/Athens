//
//  TestViewController.swift
//  Mini2 Athens
//
//  Created by Nathaniel Andrian on 11/06/21.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
