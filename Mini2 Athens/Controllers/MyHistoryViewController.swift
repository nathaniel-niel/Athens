//
//  MyHistoryViewController.swift
//  Mini2 Athens
//
//  Created by Nathaniel Andrian on 13/06/21.
//

import UIKit

class MyHistoryViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var noDataLabel: UILabel!
    
    let data = DataManipulation()
    let functionality = Functionality()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        showDataIsEmpty()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        data.retrieveData()
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.isTranslucent = true
        navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController!.navigationBar.shadowImage = UIImage()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setup(){
        navigationItem.title = "Analyze History"
        table.delegate = self
        table.dataSource = self
        table.register(UINib(nibName: "\(MyHistoryTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "cell")
        table.separatorStyle = .none
    }
    
    private func showDataIsEmpty(){
        let status = functionality.dataIsEmpty()
        if status {
            noDataLabel.text = "No record data"
            noDataLabel.textAlignment = .center
            noDataLabel.textColor = .white
            noDataLabel.frame = CGRect(x: view.center.x/2, y: view.center.y, width: 200, height: 21)
        }
        else{
            noDataLabel.isHidden = true
        }
    }
}

extension MyHistoryViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return data.model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyHistoryTableViewCell
        cell.iconMovement.image = UIImage(named: data.model[indexPath.item].contentIconName)
        cell.movementName.text = data.model[indexPath.item].movementName
        cell.dateLabel.text = functionality.convertDateToString(currentDate: data.model[indexPath.item].recordDate) 
        cell.correctMovementPercentage.text = data.model[indexPath.item].movementAccuracy
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = DetailViewController()
        
        vc.movementName = data.model[indexPath.item].movementName
        vc.recordDate = functionality.convertDateToString(currentDate: data.model[indexPath.item].recordDate)
        vc.accuracy = data.model[indexPath.item].movementAccuracy
        vc.movementLog = data.model[indexPath.item].movementLog
        vc.videoPath = data.model[indexPath.item].videoPath
        
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
