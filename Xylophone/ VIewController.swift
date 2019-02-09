//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Updated by Brad Martin on 09/02/2019.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    // global (class) vars
    var audioPlayer: AVAudioPlayer?
    
    // boilerplate iOS
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func notePressed(_ sender: UIButton) {
        playSound(noteIndex: sender.tag)
    }

    func playSound(noteIndex: Int) {
        
        let sfName = "note" + String(noteIndex)
        
        do {
            if let fileURL = Bundle.main.path(forResource: sfName, ofType: "wav") {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
                audioPlayer?.play()
                print("Audio file trying to play: \(sfName)")
            } else {
                print("No file with specified name exists")
            }
        } catch let error {
            print("Can't play the audio file failed with an error \(error.localizedDescription)")
        }
        
    }
    
}

