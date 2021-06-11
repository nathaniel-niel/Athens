//
//  ExerciseProgramListViewController.swift
//  Mini2 Athens
//
//  Created by Rostadhi Akbar, M.Pd on 10/06/21.
//

import Foundation
import UIKit

class ExerciseProgramListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    @IBOutlet weak var exerciseProgramListTableView: UITableView!
    
    let exercises = [
        Exercise(name: "Negative", age: 1, type: .exercise)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exerciseProgramListTableView.dataSource = self
        exerciseProgramListTableView.delegate = self
        
    }
}
