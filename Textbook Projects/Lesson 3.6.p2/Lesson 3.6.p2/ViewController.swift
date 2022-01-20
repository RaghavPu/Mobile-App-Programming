//
//  ViewController.swift
//  Lesson 3.6.p2
//
//  Created by Punnam, Raghav S on 1/18/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var segueSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func yellowButtonTapped(_ sender: Any) {
        if self.shouldPerformSegue(withIdentifier: "Yellow", sender: nil) {
            performSegue(withIdentifier: "Yellow", sender: nil)
        }
    }
    
    @IBAction func greenButtonTapped(_ sender: Any) {
        if self.shouldPerformSegue(withIdentifier: "Green", sender: nil) {
            performSegue(withIdentifier: "Green", sender: nil)
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return segueSwitch.isOn
    }
    

}

