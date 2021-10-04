//
//  ViewController.swift
//  Two Buttons
//
//  Created by Punnam, Raghav S on 10/4/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = "\"\""
    }

    @IBAction func setText(_ sender: Any) {
        label.text = "\"\(textField.text ?? "")\""
    }
    
    @IBAction func clearText(_ sender: Any) {
        label.text = "\"\""
    }
    
}

