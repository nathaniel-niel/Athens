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
    
    
    let images: [UIImage?] = [UIImage(named: "plank"), UIImage(named: "pushup"), UIImage(named: "squat")]
    
    let history = DataManipulation()
    let functionality = Functionality()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        history.retrieveData()
        setDataSourceAndDelegate()
        analyzeHistoryTableView.register(UINib(nibName: "\(MyHistoryTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "cell")
        
        analyzeHistoryTableView.separatorStyle = .none
        showDataIsEmpty()
        movementCollectionView.scrollToItem(at: IndexPath(row: 1, section: 0), at: .centeredHorizontally, animated: false)
        // Do any additional setup after loading the view.
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
            print("Data Kosong")
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
        return history.model.count
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
        vc.videoName = history.model[indexPath.item].videoPath
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func showClicked(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "MyHistory", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "history")
        navigationController?.pushViewController(vc, animated: true)
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

