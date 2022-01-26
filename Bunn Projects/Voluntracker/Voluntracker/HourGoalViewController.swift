//
//  HourGoalViewController.swift
//  Voluntracker
//
//  Created by Punnam, Raghav S on 1/26/22.
//

import UIKit

class HourGoalViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    @IBOutlet var goalSlider: UISlider!
    @IBOutlet var goalTextField: UITextField!
    
    var username: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        username = defaults.string(forKey: "loggedInUser") ?? "Error"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func goalChangedField(_ sender: Any) {
        
    }
    
    @IBAction func goalChangedSlider(_ sender: Any) {
        
    }
    
    
    @IBAction func saveGoal(_ sender: Any) {
        
    }
}
