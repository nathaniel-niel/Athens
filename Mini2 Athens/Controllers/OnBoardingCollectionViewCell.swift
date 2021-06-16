//
//  OnBoardingCollectionViewCell.swift
//  Mini2 Athens
//
//  Created by Shofi Rafiiola on 15/06/21.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageView: UIImageView!

    
    func setup(_ slide: OnBoardingModel){
        imageView.image = slide.images
        
    }
    
}
