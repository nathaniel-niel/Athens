//
//  StartProgramViewController.swift
//  Mini2 Athens
//
//  Created by Maurice Tin on 11/06/21.
//

import UIKit
import AVFoundation

class StartProgramViewController: UIViewController, ExerciseTimerDelegate {
    
    @IBOutlet weak var videoLayer: UIView!
    @IBOutlet weak var workoutLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var pauseResumeLabel: UILabel!
    
    @IBOutlet weak var progressBarPlaceholder: UIView!
    
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    
    var exerciseTimer: ExerciseTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        workoutLabel.text = exercises[currentExerciseIndex].getLabel()
        progressLabel.text = "\(currentExerciseIndex+1)/\(exercises.count)"
        setProgressBar()
        setVideo()
        playVideo()
        exerciseTimer = ExerciseTimer(duration: 10, timerLabel: timerLabel)
        exerciseTimer?.delegate = self
        
        exerciseTimer?.runTimer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setProgressBar(){
        let exerciseProgress = Double(currentExerciseIndex+1)/Double(exercises.count)
        
        progressBar.widthAnchor.constraint(equalTo: progressBarPlaceholder.widthAnchor, multiplier: CGFloat(exerciseProgress)).isActive = true
    }
    
    func setVideo(){
        let videoName = exercises[currentExerciseIndex].type.getVideo()
        guard let path = Bundle.main.path(forResource: videoName, ofType: "mp4") else {return}
        
        player = AVPlayer(url: URL(fileURLWithPath: path))
        playerLayer = AVPlayerLayer(player: player)
        player.isMuted = true
        playerLayer.frame = videoLayer.bounds
        playerLayer.videoGravity = .resizeAspectFill
        self.videoLayer.layer.addSublayer(playerLayer)
    }
    
    func playVideo(){
        player.play()
        videoLayer.bringSubviewToFront(progressLabel)
        loopVideo(videoPlayer: player)
    }

    func loopVideo(videoPlayer: AVPlayer){
        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil, queue: nil){ notification in

            videoPlayer.seek(to: CMTime.zero)
            self.playVideo()
        }
    }
    
    func timesUp(){
        currentExerciseIndex += 1
        if currentExerciseIndex      == exercises.count{
            let vc = self.storyboard?.instantiateViewController(identifier: "EndProgram")
            navigationController?.pushViewController(vc!, animated: true)
            return
        }
         let targetStoryboard = UIStoryboard(name: "Rest", bundle: nil)
         let vc = targetStoryboard.instantiateViewController(identifier: "Rest")
         navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func pauseClicked(_ sender: UIButton) {
        guard let timerIsRunning = exerciseTimer?.isTimerRunning else {return}
        if timerIsRunning{
            pauseResumeLabel.text = "Resume"
            player.pause()
        }else{
            pauseResumeLabel.text = "Pause"
            playVideo()
        }
        
        exerciseTimer?.pauseResumeTimer()
    }
    
    @IBAction func doneClicked(_ sender: UIButton) {
        exerciseTimer?.finishTimer()
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


