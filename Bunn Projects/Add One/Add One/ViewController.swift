//
//  ViewController.swift
//  Add One
//
//  Created by Punnam, Raghav S on 1/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var inputField: UITextField!
    
    var score = 0
    var turns = 0
    var time: Double = 10
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        generateRandomNumber()
        
    }

    @IBAction func inputFieldChanged(_ sender: Any) {
        guard let number = numberLabel.text, let input = inputField.text else { return }
        guard input.count == 4 else { return }
        
        performGameCheck(number, input)
        if (turns == 0) {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        }
        turns += 1
        
    }
    
    @objc func fireTimer() {
        time -= 0.1
        timeLabel.text = "\(round(time * 10) / 10.0)"
        if (time > 0.1) { return }
        // Create new Alert
        timer.invalidate();
        let message = UIAlertController(title: "Score: \(scoreLabel.text ?? "0")", message: "Game Over", preferredStyle: .alert)
        
        // Create OK button with action handler
        let doneButton = UIAlertAction(title: "Play Again", style: .default, handler: { (action) -> Void in
            self.score = 0
            self.turns = 0
            self.time = 10
            self.scoreLabel.text = "\(self.score)"
            self.timeLabel.text = "\(self.time)"
            self.generateRandomNumber()
         })
        
        //Add OK button to a dialog message
        message.addAction(doneButton)
        // Present Alert to
        self.present(message, animated: true, completion: nil)
    }
    
    func performGameCheck(_ number: String, _ input: String) {
        
        
        var correct = true
        for i in 0..<input.count {
            if (!isOneMore(a: input[input.index(input.startIndex, offsetBy: i)], b: number[number.index(number.startIndex, offsetBy: i)])) {
                correct = false
                break
            }
        }
        
        if (correct) { score += 1 }
        else { score -= 1 }
        scoreLabel.text = "\(score)"

        generateRandomNumber()
        inputField.text = ""
    }
    
    func generateRandomNumber() {
        let numOne = Int.random(in: 0...9)
        let numTwo = Int.random(in: 0...9)
        let numThree = Int.random(in: 0...9)
        let numFour = Int.random(in: 0...9)
        numberLabel.text = "\(numOne)\(numTwo)\(numThree)\(numFour)"
    }
    
    func isOneMore(a: Character, b: Character) -> Bool {
        guard let aNum = a.wholeNumberValue, let bNum = b.wholeNumberValue else { return false }
        if aNum == 0 && bNum == 9 { return true }
        else { return aNum == bNum + 1 }
    }
    
}
