//
//  ViewController.swift
//  Light
//
//  Created by Punnam, Raghav S on 8/25/21.
//

import UIKit

class ViewController: UIViewController {

    var lightOn = true
//    @IBOutlet var lightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    fileprivate func handleLightBackground() {
        view.backgroundColor = lightOn ? .white : .black
//        lightButton.setTitle(lightOn ? "Off" : "On", for: .normal)
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        lightOn.toggle()
        handleLightBackground()
    }
    
}

