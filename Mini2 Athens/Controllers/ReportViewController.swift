//
//  ReportViewController.swift
//  Mini2 Athens
//
//  Created by Nathaniel Andrian on 16/06/21.
//

import UIKit
import AVKit
import AVFoundation

class ReportViewController: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var cardData: UIView!
    @IBOutlet weak var cardVideo: UIView!
    @IBOutlet weak var cardMovementLog: UIView!
    @IBOutlet weak var movementNameLabel: UILabel!
    @IBOutlet weak var movementAccuracyLabel: UILabel!
    @IBOutlet weak var recordDateLabel: UILabel!
    @IBOutlet weak var movementLogLabel: UILabel!
    @IBOutlet weak var playRecordedVideoButton: UIButton!
    @IBOutlet weak var suggestedExerciseButton: UIButton!
    @IBOutlet weak var retryAnalyzeButton: UIButton!
    @IBOutlet weak var analyzeAnotherMovementButton: UIButton!
    
    
    var playerviewController = AVPlayerViewController()
    var playerView = AVPlayer() //video representation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

        // Do any additional setup after loading the view.
    }
    
    private func setup(){
        cardData.layer.cornerRadius = 20
        cardData.layer.borderWidth = 2
        cardData.layer.borderColor = #colorLiteral(red: 0.1647058824, green: 0.1921568627, blue: 0.1960784314, alpha: 1)
        cardData.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cardData.layer.shadowRadius = 8
        cardData.layer.shadowOffset = .zero
        
        cardVideo.layer.cornerRadius = 20
        cardVideo.layer.borderWidth = 2
        cardVideo.layer.borderColor = #colorLiteral(red: 0.1647058824, green: 0.1921568627, blue: 0.1960784314, alpha: 1)
        cardVideo.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cardVideo.layer.shadowRadius = 8
        cardVideo.layer.shadowOffset = .zero
        
        cardMovementLog.layer.cornerRadius = 20
        cardMovementLog.layer.borderWidth = 2
        cardMovementLog.layer.borderColor = #colorLiteral(red: 0.1647058824, green: 0.1921568627, blue: 0.1960784314, alpha: 1)
        cardMovementLog.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cardMovementLog.layer.shadowRadius = 8
        cardMovementLog.layer.shadowOffset = .zero
        
        playRecordedVideoButton.layer.cornerRadius = 13
        
        suggestedExerciseButton.layer.cornerRadius = 25
        
        retryAnalyzeButton.layer.cornerRadius = 25
        retryAnalyzeButton.layer.borderWidth = 1
        retryAnalyzeButton.layer.borderColor = #colorLiteral(red: 1, green: 0.337254902, blue: 0.1019607843, alpha: 1)
        
        analyzeAnotherMovementButton.layer.cornerRadius = 25
        analyzeAnotherMovementButton.layer.borderWidth = 1
        analyzeAnotherMovementButton.layer.borderColor = #colorLiteral(red: 1, green: 0.337254902, blue: 0.1019607843, alpha: 1)
        
        
    }
    
    func playVideo(videoName: String){
        let path = Bundle.main.path(forResource: videoName, ofType: "mp4")
        let url = URL(fileURLWithPath: path!)
        playerView = AVPlayer(url: url)
        playerviewController.player = playerView
        self.present(playerviewController, animated: true, completion: nil)
        self.playerviewController.player?.play()
    }
    

  
    @IBAction func didPlayRecordedVideoTapped(_ sender: Any) {
        playVideo(videoName: "testVideo1")
    }
    
    @IBAction func didSuggestedExerciseProgramTapped(_ sender: Any) {
    }
    
    @IBAction func didRetryAnalyzeMovementTapped(_ sender: Any) {
    }
    
    @IBAction func didAnalyzeAnotherMovementTapped(_ sender: Any) {
        
    }
    
    
}
