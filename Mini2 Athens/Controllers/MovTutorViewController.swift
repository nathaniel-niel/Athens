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
    
    var playerviewController = AVPlayerViewController()
    var playerView = AVPlayer() //video representation
    
    let functionality = Functionality()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponent()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupComponent(){
        backButton.layer.cornerRadius = 20
        customModalView.layer.cornerRadius = 50
        startAnalyzeButton.layer.cornerRadius = 25
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
