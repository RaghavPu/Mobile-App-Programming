//
//  HourGoalViewController.swift
//  Voluntracker
//
//  Created by Punnam, Raghav S on 1/26/22.
//

import UIKit

class HourGoalViewController: UIViewController {
    
    static let DefaultGoal: Int = 20

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
        if getGoalsDict()[username] == nil {
            var goals = getGoalsDict()
            goals[username] = String(HourGoalViewController.DefaultGoal)
            defaults.setValue(goals, forKey: "goals")
        }
        print(getGoalsDict())
        setUI()
    }
    
    
    @IBAction func goalChangedField(_ sender: Any) {
        guard let goal = Int(goalTextField.text!) else {return}
        goalSlider.value = Float(goal)
    }
    
    
    @IBAction func goalChangedSlider(_ sender: Any) {
        let goal = Int(goalSlider.value.rounded())
        goalTextField.text = "\(goal)"
    }
    
    
    @IBAction func saveGoal(_ sender: Any) {
        setGoalsForUsername(goal: goalTextField.text!)
        
        // Create new Alert
        let message = UIAlertController(title: "Success!", message: "Goal has been set!", preferredStyle: .alert)
         
         // Create OK button with action handler
         let ok = UIAlertAction(title: "Done", style: .default, handler: nil)
         
         //Add OK button to a dialog message
         message.addAction(ok)
        
         // Present Alert to
         self.present(message, animated: true, completion: nil)
    }
    
    
    // MARK: - Helper Methods
    func setUI() {
        let goals = getGoalsDict()
        goalTextField.text = goals[username]
        goalSlider.value = Float(Int(goals[username]!)!)
    }
    
    func setGoalsForUsername(goal: String) {
        var goals = getGoalsDict()
        goals[username] = goal
        defaults.setValue(goals, forKey: "goals")
    }
    
    func getGoalsDict() -> [String: String] {
        return defaults.dictionary(forKey: "goals") as! [String: String]
    }
    
}
