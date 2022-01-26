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
        if defaults.dictionary(forKey: "logins") == nil || defaults.dictionary(forKey: "securityPins") == nil  {
            initializeDefaults()
        } else {
            print(defaults.dictionary(forKey: "logins")!)
            print(defaults.dictionary(forKey: "securityPins")!)
        }
        
    }
    
    func initializeDefaults() {
        let loginDict: [String: String] = ["Raghav" : "03052004"]
        defaults.set(loginDict, forKey: "logins")
        
        let securityDict: [String: String] = ["Raghav" : "1234"]
        defaults.set(securityDict, forKey: "securityPins")
        
        let goalDict: [String: String] = [:]
        defaults.set(goalDict, forKey: "goals")
        
        let amountDict: [String: String] = [:]
        defaults.set(amountDict, forKey: "hoursAmount")
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "login" {
            defaults.setValue(usernameField.text!, forKey: "loggedInUser")
        }
    }
}

