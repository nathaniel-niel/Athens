//
//  MyHistoryViewController.swift
//  Mini2 Athens
//
//  Created by Nathaniel Andrian on 13/06/21.
//

import UIKit

class MyHistoryViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    let data = DataManipulation()
    let functionality = Functionality()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        showDataIsEmpty()
        
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
            print("data kosong")
        }
    }
}

extension MyHistoryViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return data.model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyHistoryTableViewCell
        cell.iconMovement.image = UIImage(named: data.model[indexPath.item].movementIconName)
        cell.movementName.text = data.model[indexPath.item].movementName
        cell.dateLabel.text = data.model[indexPath.item].recordDate
        cell.correctMovementPercentage.text = data.model[indexPath.item].movementAccuracy
        return cell
    }
    
}
