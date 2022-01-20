//
//  ViewController.swift
//  Voluntracker
//
//  Created by Punnam, Raghav S on 1/20/22.
//

import UIKit

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard

    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if defaults.dictionary(forKey: "logins") == nil {
            initializeDefaults()
        }
    }
    
    func initializeDefaults() {
        let loginDict: [String: String] = ["Raghav" : "03052004"]
        defaults.set(loginDict, forKey: "logins")
        
        let securityDict: [String: Int] = ["Raghav" : 1234]
        defaults.set(securityDict, forKey: "securityPins")
    }

    @IBAction func loginPressed(_ sender: Any) {
        guard let logins = defaults.dictionary(forKey: "logins") as? [String: String] else {return}
        for loginUsername in logins.keys {
            if loginUsername == usernameField.text {
                if passwordField.text == logins[loginUsername] {
                    performSegue(withIdentifier: "login", sender: self)
                    return
                }
            }
        }
        
        // Create new Alert
        let message = UIAlertController(title: "Invalid Login Credentials", message: "Username/Password is Incorrect", preferredStyle: .alert)
         
         // Create OK button with action handler
         let ok = UIAlertAction(title: "Retry", style: .default, handler: { (action) -> Void in
            self.passwordField.text = ""
         })
         
         //Add OK button to a dialog message
         message.addAction(ok)
        
         // Present Alert to
         self.present(message, animated: true, completion: nil)
    }
    
}
