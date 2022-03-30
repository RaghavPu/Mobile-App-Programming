//
//  ViewController.swift
//  Wordle
//
//  Created by Punnam, Raghav S on 3/30/22.
//

import UIKit

class ViewController: UIViewController {

    var game: Game = Game()
    
    @IBOutlet var gameFrames: [UILabel]!
    @IBOutlet var keyboardBtns: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gameFrames[3].text = "B"
    }
    
    @IBAction func letterClicked(_ sender: UIButton) {
        print(sender.titleLabel?.text)
    }
    

    @IBAction func enterWord(_ sender: Any) {
        
    }
    
    @IBAction func deleteLetter(_ sender: Any) {
        
    }
}

