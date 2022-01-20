//
//  ViewController.swift
//  Lesson 3.6
//
//  Created by Punnam, Raghav S on 1/18/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = textField.text
    }

    @IBAction func unwindToRed(unwindSegue: UIStoryboardSegue) {
        
    }

}

