//
//  MovTutorViewController.swift
//  Mini2 Athens
//
//  Created by Nathaniel Andrian on 19/06/21.
//

import UIKit

class MovTutorViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var startAnalyzeButton: UIButton!
    @IBOutlet weak var customModalView: UIView!
    @IBOutlet weak var backButton: UIButton!
    
    let functionality = Functionality()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponent()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupComponent(){
        backButton.layer.cornerRadius = 20
        customModalView.layer.cornerRadius = 50
        startAnalyzeButton.layer.cornerRadius = 25
        
    }
    
    

    @IBAction func didbackButtonTapped(_ sender: Any) {
        functionality.back(vc: self)
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
