//
//  MovTutorViewController.swift
//  Mini2 Athens
//
//  Created by Nathaniel Andrian on 19/06/21.
//

import UIKit
import AVKit
import AVFoundation

class MovTutorViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var startAnalyzeButton: UIButton!
    @IBOutlet weak var customModalView: UIView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var TutorImage: UIImageView!
    var playerviewController = AVPlayerViewController()
    var playerView = AVPlayer() //video representation
    
    
    //Image sequence var
    var image1: UIImage!
    var image2: UIImage!
    var image3: UIImage!
    var image4: UIImage!
    
    
    var imageSequence: [UIImage]!
    var animate: UIImage!
    
    let functionality = Functionality()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponent()
        setupImageSequence()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupComponent(){
        backButton.layer.cornerRadius = 20
        customModalView.layer.cornerRadius = 50
        startAnalyzeButton.layer.cornerRadius = 25
    }
    
    func setupImageSequence(){
        image1 = UIImage(named: "1")
        image2 = UIImage(named: "2")
        image3 = UIImage(named: "3")
        image4 = UIImage(named: "4")
        
        imageSequence = [image1, image2, image3, image4]
        
        animate = UIImage.animatedImage(with: imageSequence, duration: 1.0)
        
        TutorImage.image = animate
        
        
    }
    
    func playVideo(videoName: String){
        let path = Bundle.main.path(forResource: videoName, ofType: "mp4")
        let url = URL(fileURLWithPath: path!)
        playerView = AVPlayer(url: url)
        playerviewController.player = playerView
        self.present(playerviewController, animated: true, completion: nil)
        self.playerviewController.player?.play()
    }
    
    
    @IBAction func didPlayButtonTapped(_ sender: Any) {
        playVideo(videoName: "testVideo1")
    }
    
    @IBAction func didbackButtonTapped(_ sender: Any) {
        functionality.back(vc: self)
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
