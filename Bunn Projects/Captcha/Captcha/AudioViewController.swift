//
//  AudioViewController.swift
//  Captcha
//
//  Created by Punnam, Raghav S on 3/16/22.
//

import UIKit
import AVFoundation

class AudioViewController: UIViewController {

  
    @IBOutlet var buttons: [CaptchaButtonView]!
    
    var correctSound: String = ""
    var soundNames = [String]()
    
    var player: AVAudioPlayer?
    
    var numberOfTries: Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadButtons()
        
        correctSound = soundNames.randomElement()!
    }
    

    @IBAction func playSound(_ sender: Any) {
        let url = Bundle.main.url(forResource: correctSound, withExtension: "wav", subdirectory: "Sounds")

        do {
            player = try AVAudioPlayer(contentsOf: url!)
            guard let player = player else { return }

            player.prepareToPlay()
            player.play()

        } catch let error as NSError {
            print(error.description)
        }
    }
    
    
    
    @IBAction func buttonPressed(_ sender: CaptchaButtonView) {
        if numberOfTries <= 0 {
            performSegue(withIdentifier: "soundBlock", sender: self)
        }
        
        let answerClicked = sender.titleLabel?.text
        
        print(answerClicked)
        print(correctSound)
        
        if correctSound == answerClicked {
            performSegue(withIdentifier: "soundToSuccess", sender: self)
        } else {
            sender.shake()
            numberOfTries -= 1
            if numberOfTries <= 0 {
                performSegue(withIdentifier: "soundBlock", sender: self)
            }
        }
    }
    
    
    func loadButtons() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath! + "/Sounds"

        do {
            var items = try fm.contentsOfDirectory(atPath: path)
            
            for button in buttons {
                let randomIndex = Int.random(in: 0..<items.count)
                let item = items.remove(at: randomIndex)
                button.setTitle(String(item.prefix(item.count - 4)), for: .normal)
                soundNames.append(String(item.prefix(item.count - 4)))
            }
            
            print(soundNames)
        } catch {
            print("Unable to read captcha images.")
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
