//
//  CreateAccountViewController.swift
//  Voluntracker
//
//  Created by Punnam, Raghav S on 1/20/22.
//

import UIKit

class CreateAccountViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var securityPinField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        guard let logins = defaults.dictionary(forKey: "logins") as? [String: String] else {return}
        
        guard usernameField.text!.count >= 4 else {
            sendAlert(title: "Invalid Usernam", message: "Username must be atleast 4 characters")
            return
        }
        
        guard logins[usernameField.text!] == nil else {
            sendAlert(title: "Invalid Username", message: "Username is already taken")
            return
        }
        
        guard passwordField.text!.count >= 8 else {
            sendAlert(title: "Invalid Password", message: "Password must be atleast 8 characters")
            return
        }
        
        guard securityPinField.text!.count == 4 && isStringAnInt(string: securityPinField.text!) else {
            sendAlert(title: "Invalid Pin", message: "Pin must be a 4-digit numerical value")
            return
        }
        
        // TODO: Impelement saving to defaults
    }
    
    
    func sendAlert(title: String, message: String) {
        // Create new Alert
        let message = UIAlertController(title: title, message: message, preferredStyle: .alert)
         
         // Create OK button with action handler
         let ok = UIAlertAction(title: "Retry", style: .default, handler: { (action) -> Void in
            self.usernameField.text = ""
            self.passwordField.text = ""
            self.securityPinField.text = ""
         })
         
         //Add OK button to a dialog message
         message.addAction(ok)
        
         // Present Alert to
         self.present(message, animated: true, completion: nil)
    }
    
    func isStringAnInt(string: String) -> Bool {
        return Int(string) != nil
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
