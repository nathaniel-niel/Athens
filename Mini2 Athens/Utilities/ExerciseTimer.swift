//
//  Timer.swift
//  Mini2 Athens
//
//  Created by Maurice Tin on 08/06/21.
//

import Foundation
import UIKit

class ExerciseTimer {
    var duration: Int?
    var isTimerRunning: Bool?
    var timer: Timer?
    var timerLabel: UILabel?
    var seconds: Int?
    
    init(duration: Int?) {
        self.duration = duration
        self.isTimerRunning = false
        self.timer = Timer()
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:(#selector(ExerciseTimer.updateTimer)) , userInfo: nil, repeats: true)
        
        self.isTimerRunning = true
        guard let timer = timer else { return }
        RunLoop.current.add(timer, forMode: .common)
    }
    
    @objc func updateTimer(){
        if duration! < 1{
            timer?.invalidate()
            finishTimer()
        }else{
            duration! -= 1
            timerLabel?.text = timeString(time: TimeInterval(duration!))
        }
    }
    
    func timeString(time: TimeInterval) -> String{
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        
        return String(format:"%02d:%02d", minutes, seconds)
    }
    
    func finishTimer(){
        isTimerRunning = false
    }
    
    func pauseResumeTimer(){
        guard let isTimerRunning = isTimerRunning else { return }
        if !isTimerRunning{
            runTimer()
        }else{
            timer?.invalidate()
        }
    }
}
