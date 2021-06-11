//
//  StartProgramViewController.swift
//  Mini2 Athens
//
//  Created by Maurice Tin on 11/06/21.
//

import UIKit
import AVFoundation

class StartProgramViewController: UIViewController {

    @IBOutlet weak var videoLayer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        playVideo()
    }
    
    func playVideo(){
        guard let path = Bundle.main.path(forResource: "testVideo1", ofType: "mp4") else {return}
        
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = videoLayer.bounds
        playerLayer.videoGravity = .resizeAspectFill
        self.videoLayer.layer.addSublayer(playerLayer)
        
        player.play()
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
