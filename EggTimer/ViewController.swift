//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var eggProgress: UIProgressView!
    @IBOutlet weak var eggLabel: UILabel!
    
    var player: AVAudioPlayer!
    var counter = 0
    
    var timer = Timer()
    let eggTimes = ["Soft":30, "Medium":8*60, "Hard":12*60]
    var totalTime = 0
    var secondsPassed = 0
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        
        if sender.currentTitle! == "Hard"{
         eggLabel.text = "\(sender.currentTitle!), huh? Interesting Choice."
        } else if sender.currentTitle == "Medium"{
            eggLabel.text = "Always going for the middle, aren't you?"
        } else {
            eggLabel.text = "I too, like my eggs soft. Just like you!"
        }
        
       eggProgress.progress = 0.0
       let hardness = sender.currentTitle!
         totalTime = eggTimes[hardness]!
        secondsPassed = 0
        
         timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
       
    }


    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totalTime {
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            eggProgress.progress = Float(percentageProgress)
           
            
            
        }
        else{
            timer.invalidate()
            eggLabel.text = "DONE!"
            playSound()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}
