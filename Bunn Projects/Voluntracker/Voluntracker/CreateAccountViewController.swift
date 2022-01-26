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
        guard var logins = defaults.dictionary(forKey: "logins") as? [String: String] else {return}
        
        guard usernameField.text!.count >= 4 else {
            sendAlert(title: "Invalid Username", message: "Username must be atleast 4 characters")
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
        
        guard securityPinField.text!.count == 4 else {
            sendAlert(title: "Invalid Pin", message: "Pin must be a 4-digit numerical value")
            return
        }

        logins[usernameField.text!] = passwordField.text!
        defaults.set(logins, forKey: "logins")
        
        if var securityDict = defaults.dictionary(forKey: "securityPins") {
            securityDict[usernameField.text!] = securityPinField.text!
            defaults.set(securityDict, forKey: "securityPins")
        }
        

        let message = UIAlertController(title: "Success", message: "Account Created Successfully", preferredStyle: .alert)
         
         // Create OK button with action handler
         let ok = UIAlertAction(title: "Login Page", style: .default, handler: { (action) -> Void in
            _ = self.navigationController?.popToRootViewController(animated: true)
         })
         
         //Add OK button to a dialog message
         message.addAction(ok)
        
         // Present Alert to
         self.present(message, animated: true, completion: nil)
        
    }
    
    
    func sendAlert(title: String, message: String) {
        // Create new Alert
        let message = UIAlertController(title: title, message: message, preferredStyle: .alert)
         
         // Create OK button with action handler
         let ok = UIAlertAction(title: "Retry", style: .default, handler: { (action) -> Void in
            self.passwordField.text = ""
         })
         
         //Add OK button to a dialog message
         message.addAction(ok)
        
         // Present Alert to
         self.present(message, animated: true, completion: nil)
    }
    
    func isStringAnInt(string: String) -> Bool {
        return Int(string) != nil
    }
    
    @IBAction func unwindToLogin(unwindSegue: UIStoryboardSegue) {
        
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
