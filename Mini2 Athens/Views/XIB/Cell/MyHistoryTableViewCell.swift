//
//  MyHistoryTableViewCell.swift
//  Mini2 Athens
//
//  Created by Nathaniel Andrian on 13/06/21.
//

import UIKit

class MyHistoryTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var iconMovement: UIImageView!
    @IBOutlet weak var movementName: UILabel!
    @IBOutlet weak var correctMovementPercentage: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view.layer.cornerRadius = 15
        view.layer.cornerRadius = 15
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 10
        view.layer.shadowColor = UIColor.black.cgColor
        
        

    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
