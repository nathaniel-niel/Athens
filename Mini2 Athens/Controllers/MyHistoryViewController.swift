//
//  MyHistoryViewController.swift
//  Mini2 Athens
//
//  Created by Nathaniel Andrian on 13/06/21.
//

import UIKit

class MyHistoryViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Analyze History"
        table.delegate = self
        table.dataSource = self
        table.register(UINib(nibName: "\(MyHistoryTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "cell")
        table.separatorStyle = .none
        
        
    }

}

extension MyHistoryViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!MyHistoryTableViewCell
        
        return cell
    }
    
}
