//
//  HomeViewController.swift
//  Mini2 Athens
//
//  Created by Maurice Tin on 10/06/21.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var movementCollectionView: UICollectionView!
    @IBOutlet weak var analyzeHistoryTableView: UITableView!
    @IBOutlet weak var showMoreButton: UIButton!
    @IBOutlet weak var noDataLabel: UILabel!
    
    
    let images: [UIImage?] = [UIImage(named: "plank"), UIImage(named: "pushup"), UIImage(named: "squat")]
    let history = DataManipulation()
    let functionality = Functionality()
    
    let state = UserState()
    
    override func viewDidLayoutSubviews() {
        if state.isNewUser(){
            let vc = storyboard?.instantiateViewController(identifier: "onboarding") as! OnBoardingViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataSourceAndDelegate()
        history.retrieveData()
        showDataIsEmpty()
        analyzeHistoryTableView.register(UINib(nibName: "\(MyHistoryTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "cell")

        analyzeHistoryTableView.separatorStyle = .none
        
        movementCollectionView.scrollToItem(at: IndexPath(row: 1, section: 0), at: .centeredHorizontally, animated: false)
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        history.retrieveData()
    }
    
    
    func setDataSourceAndDelegate(){
        analyzeHistoryTableView.dataSource = self
        analyzeHistoryTableView.delegate = self
        movementCollectionView.dataSource = self
        movementCollectionView.delegate = self
    }
    
    private func showDataIsEmpty(){
        let status = functionality.dataIsEmpty()
        if status{
            showMoreButton.isHidden = true
            noDataLabel.text = "No record data"
            noDataLabel.textAlignment = .center
            noDataLabel.textColor = .white
            noDataLabel.frame = CGRect(x: view.center.x/2, y: 600, width: 200, height: 21)
            
        }
        else{
            noDataLabel.isHidden = true
            showMoreButton.isHidden = false
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movementCell", for: indexPath) as! MovementCollectionViewCell
        
        cell.movementImage.image = images[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //buat lanjut ke movement tutorial
        let vc = storyboard?.instantiateViewController(withIdentifier: "movTutor") as! MovTutorViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if history.model.count < 3 {
            return history.model.count
        }
        else{
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = analyzeHistoryTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyHistoryTableViewCell
        cell.iconMovement.image = UIImage(named: history.model[indexPath.item].contentIconName)
        cell.movementName.text = history.model[indexPath.item].movementName
        cell.dateLabel.text = functionality.convertDateToString(currentDate: history.model[indexPath.item].recordDate)
        cell.correctMovementPercentage.text = history.model[indexPath.item].movementAccuracy
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        
        vc.movementName = history.model[indexPath.item].movementName
        vc.recordDate = functionality.convertDateToString(currentDate: history.model[indexPath.item].recordDate)
        vc.accuracy = history.model[indexPath.item].movementAccuracy
        vc.movementLog = history.model[indexPath.item].movementLog
        vc.videoPath = history.model[indexPath.item].videoPath
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    
    @IBAction func showClicked(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "MyHistory", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "history")
        navigationController?.pushViewController(vc, animated: true)
    }
    

}

