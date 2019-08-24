//
//  MainViewController.swift
//  TextToSpeech
//
//  Created by Ryan Rottmann on 8/23/19.
//  Copyright © 2019 Ryan Rottmann. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {

    @IBOutlet weak var textView1: UITextView!
    @IBOutlet weak var rateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func playButton(_ sender: Any) {
        
        let utterance = AVSpeechUtterance(string: textView1.text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        let float = (rateLabel.text! as NSString).floatValue
        utterance.rate = float
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
    @IBAction func clearButton(_ sender: Any) {
        textView1.text = ""
    }
    @IBAction func rateUp(_ sender: Any) {
        var rate = (rateLabel.text! as NSString).floatValue
        if(rate <= 0.5){
            rate += 0.1
            rateLabel.text = String(rate)
        }

        
    }
    @IBAction func rateDown(_ sender: Any) {
        var rate = (rateLabel.text! as NSString).floatValue
        if(rate >= 0.4){
            rate -= 0.1
            rateLabel.text = String(rate)
        }

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
