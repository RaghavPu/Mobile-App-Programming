//
//  ForgotPasswordViewController.swift
//  Voluntracker
//
//  Created by Punnam, Raghav S on 1/24/22.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    let defaults = UserDefaults.standard

    @IBOutlet var usernameField: UITextField!
    @IBOutlet var securityPinField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recoverRequested(_ sender: Any) {
        guard let logins = defaults.dictionary(forKey: "logins") as? [String: String] else {return}
        guard let securityDict = defaults.dictionary(forKey: "securityPins") as? [String: String] else {return}
        
        guard logins[usernameField.text!] != nil else {
            sendAlert(title: "Invalid Username", message: "Username does not exist")
            return
        }
        
        // TODO: Impelement saving to defaults
        guard securityDict[usernameField.text!] == securityPinField.text! else {
            sendAlert(title: "Incorrect Pin", message: "Pin is not correct for username.")
            return
        }

        let message = UIAlertController(title: "Password", message: logins[usernameField.text!], preferredStyle: .alert)
         
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
         })
         
         //Add OK button to a dialog message
         message.addAction(ok)
        
         // Present Alert to
         self.present(message, animated: true, completion: nil)
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
