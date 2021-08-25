//
//  ViewController.swift
//  Lesson1.8
//
//  Created by Punnam, Raghav S on 8/25/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let label = UILabel(frame: CGRect(x: 16, y: 16, width: 200,
        height: 44))
        label.text = "Hello"
        view.addSubview(label) // Adds label as a child view to `view`
        
        myButton.setTitleColor(.red, for: .normal)
    }

    @IBAction func buttonPressed(_ sender: Any) {
        print("Button got pressed.")
    }
    
}

