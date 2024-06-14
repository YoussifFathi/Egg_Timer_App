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
    var player : AVAudioPlayer!

    let timeDict : [String : Int] = ["Soft" : 5 *60 ,"Medium" : 8 * 60,"Hard" : 12 * 60]
    
    var timer = Timer()

    @IBOutlet weak var headerLabel: UILabel!
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func EggPressed(_ sender: UIButton) {

        timer.invalidate()
        self.headerLabel.text = "In Progress"
        self.progressBar.setProgress(0 , animated: true)
        let hardnessSelected = sender.currentTitle ?? ""
        let selectedTime : Int = timeDict[hardnessSelected] ?? 0
        var remaingTime : Int = selectedTime
        
         timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if remaingTime > 0{
                print(remaingTime)
                remaingTime -= 1
                self.progressBar.setProgress(Float(selectedTime - remaingTime) / Float(selectedTime), animated: true)
            }else{
                timer.invalidate()
                self.headerLabel.text = "Done"
                self.progressBar.setProgress(1, animated: true)
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                self.player = try! AVAudioPlayer(contentsOf: url!)
                self.player.play()


            }
       
        }
        
    }
    
}
