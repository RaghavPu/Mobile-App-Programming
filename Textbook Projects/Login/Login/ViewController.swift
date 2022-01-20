//
//  ViewController.swift
//  Login
//
//  Created by Punnam, Raghav S on 1/18/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var usernameField: UITextField!
    @IBOutlet var forgotUsernameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func forgotInfoPressed(_ sender: Any) {
        performSegue(withIdentifier: "ForgotInfoSegue", sender: sender)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIButton else { return }
        
        if button == forgotUsernameButton {
            segue.destination.navigationItem.title = "Forgot Username"
        } else if button == forgotPasswordButton {
            segue.destination.navigationItem.title = "Forgot Password"
        } else {
            segue.destination.navigationItem.title = usernameField.text
        }
    }
    
    

}

