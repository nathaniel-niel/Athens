//
//  ExerciseProgramListViewController.swift
//  Mini2 Athens
//
//  Created by Rostadhi Akbar, M.Pd on 10/06/21.
//

import Foundation
import UIKit

class ExerciseProgramListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var exerciseProgramListTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exerciseProgramListTableView.dataSource = self
        exerciseProgramListTableView.delegate = self
        let nib = UINib(nibName: "\(ExerciseTableViewCell.self)", bundle: nil)
        
        exerciseProgramListTableView.register(nib, forCellReuseIdentifier: "ExerciseCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseListIdentifier") as! ExerciseProgramListTableViewCell
//
//        cell.eView.layer.cornerRadius = 30
//        cell.eView.layer.borderWidth = 3
//        cell.eView.layer.masksToBounds = true
//        cell.eView.backgroundColor = exercises[indexPath.row].type?.getColor()
//        cell.exerciseProgramImageView.image = exercises[indexPath.row].type?.getImage()
//        cell.nameLabel.text = exercises[indexPath.row].name
//        cell.typeLabel.text = exercises[indexPath.row].type?.rawValue
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell") as! ExerciseTableViewCell
        
        cell.exerciseIcon.image = exercises[indexPath.row].type?.getImage()
        cell.exerciseName.text = exercises[indexPath.row].name
        cell.exerciseDescription.text = exercises[indexPath.row].type?.rawValue
        
        return cell
    }
    
    @IBAction func startProgram(_ sender: UIButton){
        //     tinggal masukin identifier ke page yang maurice kerjain
//        performSegue(withIdentifier: "", sender: self)
        currentExerciseIndex = 0
        let targetStoryboard = UIStoryboard(name: "StartProgram", bundle: nil)
        
        let vc = targetStoryboard.instantiateViewController(identifier: "StartProgram") as! StartProgramViewController
    
        navigationController?.pushViewController(vc, animated: true)
    }
}



