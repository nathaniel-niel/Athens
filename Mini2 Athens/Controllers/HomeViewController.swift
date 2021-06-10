//
//  HomeViewController.swift
//  Mini2 Athens
//
//  Created by Maurice Tin on 10/06/21.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var workoutCollectionView: UICollectionView!
    
    let images: [UIImage?] = [UIImage(named: "Pushup-1"), UIImage(named: "Plank-1"), UIImage(named: "Squat-1")]

//    let images = [UIImage(named: "Pushup-1")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        workoutCollectionView.delegate = self
        workoutCollectionView.dataSource = self
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkoutCollectionViewCell", for: indexPath) as! WorkoutCollectionViewCell
        
        cell.workoutImage.image = images[indexPath.row]
        return cell
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
