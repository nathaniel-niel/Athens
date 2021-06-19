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
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = pushUpDescription
        exerciseProgramListTableView.dataSource = self
        exerciseProgramListTableView.delegate = self
        let nib = UINib(nibName: "\(ExerciseTableViewCell.self)", bundle: nil)
        
        exerciseProgramListTableView.register(nib, forCellReuseIdentifier: "ExerciseCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.isTranslucent = true
        navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController!.navigationBar.shadowImage = UIImage()
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
        
        cell.exerciseIcon.image = exercises[indexPath.row].type.getImage()
        
        cell.exerciseName.text = exercises[indexPath.row].getLabel()
        
        cell.exerciseDescription.text = "\(exercises[indexPath.row].type.getDuration()) seconds"
        
        return cell
    }
    
    @IBAction func startProgram(_ sender: UIButton){
        //     tinggal masukin identifier ke page yang maurice kerjain
//        performSegue(withIdentifier: "", sender: self)
        currentExerciseIndex = 0
        currentSet = 1
        let targetStoryboard = UIStoryboard(name: "StartProgram", bundle: nil)
        
        let vc = targetStoryboard.instantiateViewController(identifier: "StartProgram") as! StartProgramViewController
    
        MusicHelper.sharedHelper.playBackgroundMusic()
        navigationController?.pushViewController(vc, animated: true)
    }
}



