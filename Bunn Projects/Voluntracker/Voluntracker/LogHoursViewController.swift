//
//  LogHoursViewController.swift
//  Voluntracker
//
//  Created by Punnam, Raghav S on 1/28/22.
//

import UIKit

class LogHoursViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    var username: String = ""
    
    @IBOutlet var loggedHours: UILabel!
    @IBOutlet var goalHours: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    
    @IBOutlet var logHoursTextField: UITextField!
    
    var timerCount = 0
    var timer = Timer()
    var celebrationEmojis = ["🥳", "🎉", "👏", "🎊"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        username = defaults.string(forKey: "loggedInUser") ?? "Error"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadUpUI()
    }
    
    @IBAction func logHourButtonPressed(_ sender: Any) {
        guard let logAmount = Int(logHoursTextField.text!) else {return}
        var loggedHoursDict = getloggedHoursDict()
        let goalsDict = getGoalsDict()
        
        loggedHoursDict[username] = String(max(0, logAmount + Int(loggedHoursDict[username]!)!))
        defaults.setValue(loggedHoursDict, forKey: "hoursAmount")
        logHoursTextField.text = ""
        
        let progress = Float(loggedHoursDict[username]!)! / Float(goalsDict[username]!)!
        if progress >= 1 {
            celebrateGoal()
        }
        
        loadUpUI()
    }
    
    func loadUpUI() {
        if getloggedHoursDict()[username] == nil {
            var loggedHoursDict = getloggedHoursDict()
            loggedHoursDict[username] = "0"
            defaults.setValue(loggedHoursDict, forKey: "hoursAmount")
        }
        
        let loggedHoursDict = getloggedHoursDict()
        let goalsDict = getGoalsDict()
        
        loggedHours.text = loggedHoursDict[username]
        goalHours.text = goalsDict[username]
        let progress = Float(loggedHoursDict[username]!)! / Float(goalsDict[username]!)!
        progressBar.setProgress(progress, animated: true)
    }
    
    func getloggedHoursDict() -> [String: String] {
        return defaults.dictionary(forKey: "hoursAmount") as! [String: String]
    }
    
    func getGoalsDict() -> [String: String] {
        return defaults.dictionary(forKey: "goals") as! [String: String]
    }
    
    func celebrateGoal() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        let message = UIAlertController(title: "Goal Reached!", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Done", style: .default) { (UIAlertAction) in
            self.timer.invalidate()
            self.timerCount = 0
        }
        message.addAction(ok)
        self.present(message, animated: true, completion: nil)
    }
    
    @objc func timerAction(){
        timerCount += 1
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        label.center = CGPoint(x: CGFloat.random(in: 0..<screenSize.width), y: CGFloat.random(in: 0..<screenSize.height))
            label.textAlignment = .center
        label.text = celebrationEmojis.randomElement()
        
        
        let degrees = CGFloat.random(in: 0..<360); //the value in degrees
        label.transform = CGAffineTransform(rotationAngle: degrees * CGFloat.pi/180)
        
        label.alpha = 0
        self.view.addSubview(label)
        celebrationEmojiAnimate(view: label)
        
        if timerCount == 20 {
            timerCount = 0
        }
    }
    
    
    func celebrationEmojiAnimate(view: UILabel) {
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseOut, animations: {
            view.alpha = 1.0
        }, completion: nil)
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseOut, animations: {
            view.alpha = 0.0
        }, completion: nil)
    }

}
