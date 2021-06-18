//
//  MusicHelper.swift
//  Mini2 Athens
//
//  Created by Maurice Tin on 18/06/21.
//

import Foundation
import AVFoundation

class MusicHelper {
    static let sharedHelper = MusicHelper()
    var audioPlayer: AVAudioPlayer?
    
    func playBackgroundMusic(){
        let aSound = URL(fileURLWithPath: Bundle.main.path(forResource: "music", ofType: "mp3")!)
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: aSound)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        }
        catch{
            print("Cannot play the file.")
        }
    }
    
    func stopBackgroundMusic(){
        audioPlayer?.stop()
    }
}
