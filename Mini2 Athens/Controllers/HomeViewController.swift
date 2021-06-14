//
//  HomeViewController.swift
//  Mini2 Athens
//
//  Created by Maurice Tin on 10/06/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var iCarouselView: iCarousel!
    
    let images: [UIImage?] = [UIImage(named: "pushup"), UIImage(named: "plank"), UIImage(named: "squat")]

//    let images = [UIImage(named: "Pushup-1")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iCarouselView.delegate = self
        iCarouselView.dataSource = self
        iCarouselView.type = .rotary
        iCarouselView.contentMode = .scaleAspectFit
        iCarouselView.isPagingEnabled = true
        // Do any additional setup after loading the view.
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

extension HomeViewController: iCarouselDelegate, iCarouselDataSource{
    func numberOfItems(in carousel: iCarousel) -> Int {
        images.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var imageView: UIImageView!
        if view == nil{
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: iCarouselView.frame.width * 0.5, height: iCarouselView.frame.height))
        }else{
            imageView = view as? UIImageView
        }
        
        imageView.image = images[index]
        return imageView
    }
    
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if option == .fadeMin{
            return 0
        }else if(option == .fadeMinAlpha){
            return 0.3
        }else if(option == .fadeMax){
            return 0.3
        }
        return value
    }
}
