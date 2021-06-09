//
//  MovementTutorialViewController.swift
//  Mini2 Athens
//
//  Created by Nathaniel Andrian on 08/06/21.
//
//soruce for AVKit: https://www.youtube.com/watch?v=mVE84Q_JoxY

import UIKit
import AVKit
import AVFoundation

class MovementTutorialViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var customModalView: UIView!
    @IBOutlet weak var startAnalyzeButton: UIButton!
    @IBOutlet weak var playVideoButton: UIButton!
    
    //MARK:: AVKit variables
    var playerviewController = AVPlayerViewController()
    var playerView = AVPlayer() //video representation
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponent()

        // Do any additional setup after loading the view.
    }

    private func setupComponent(){
        backButton.layer.cornerRadius = 20
        customModalView.layer.cornerRadius = 50
        startAnalyzeButton.layer.cornerRadius = 25
        playVideoButton.layer.cornerRadius = 15
    }

//    private func playVideo(videoUrl: String){
//
//        let url: URL = URL(string: videoUrl)!
//        playerView = AVPlayer(url: url)
//        playerviewController.player = playerView
//
//
//        //present player vc
//        self.present(playerviewController, animated: true, completion: nil)
//        self.playerviewController.player?.play()
//
//
//    }
    
    func playVideo(videoName: String){
        let path = Bundle.main.path(forResource: videoName, ofType: "mp4")
        let url = URL(fileURLWithPath: path!)
        playerView = AVPlayer(url: url)
        playerviewController.player = playerView
        self.present(playerviewController, animated: true, completion: nil)
        self.playerviewController.player?.play()
    }
    
    @IBAction func didPlayVideoButtontapped(_ sender: Any) {
//        playVideo(videoUrl: "https://www.youtube.com/watch?v=KYTtjAG48dg")
        playVideo(videoName: "testVideo1")
    }
    @IBAction func didStartAnalyzeButtonTapped(_ sender: Any) {
       
        
    }
    

    
}
