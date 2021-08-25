//
//  ViewController.swift
//  Lesson1.6
//
//  Created by Punnam, Raghav S on 8/25/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "Debugging"
        // Do any additional setup after loading the view.
        
//        let x = 4
        
        var names = ["Tammy", "Cole"]
        names.removeFirst()
        names.removeFirst()
        names.removeFirst()
    }


}

