//
//  GameViewController.swift
//  Trivia Game
//
//  Created by Punnam, Raghav S on 2/11/22.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var buttonsArr: [UIButton]!
    
    @IBOutlet var progressBar: UIProgressView!
    let userDefaults = UserDefaults.standard
    
    var questions = [Trivia]()
    var numQuestions = 1
    var trivia: Trivia? = nil
    var correct = 0, current = 1
    var correctAns = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initializeUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        reset()
    }
    
    func reset() {
        questions = Questions.data[UserDefaults.standard.string(forKey: "Topic") ?? "History"]!
        numQuestions = min(UserDefaults.standard.integer(forKey: "Questions"), questions.count)
        correct = 0
        current = 0
        progressBar.progress = 0
        newQuestion()
    }
    
    func initializeUI() {
        for (_, button) in buttonsArr.enumerated() {
            button.layer.backgroundColor = UIColor.lightGray.cgColor
            button.layer.cornerRadius = 25
        }
    }
    
    
    func newQuestion() {
        // TODO: Make a list so that questions are not repeated
        guard current < numQuestions else {
            gameOver()
            return
        }
        
        trivia = questions.remove(at: Int.random(in: 0..<questions.count))
        questionLabel.text = trivia!.q
        var choices = [0, 1, 2, 3]
        for i in 0..<(choices.count - 1) {
            buttonsArr[choices.remove(at: Int.random(in: 0..<choices.count))].setTitle(trivia?.incorrect[i], for: .normal)
        }
        
        buttonsArr[choices[0]].setTitle(trivia?.correct, for: .normal)
        correctAns = choices[0]
        current += 1
        progressBar.progress = Float(current) / Float(numQuestions)
        print(progressBar.progress)
    }
    
    
    @IBAction func answerClicked(_ sender: UIButton) {
        let answer = sender.titleLabel?.text
        if (trivia?.correct == answer) {
            correct += 1
        }
        
        correctAnimate()
    }
    
    func correctAnimate() {
        UIView.animate(withDuration: TimeInterval.init(3.0)) {
            for (i, button) in self.buttonsArr.enumerated() {
                if (i != self.correctAns) {
                    button.layer.backgroundColor = UIColor.red.cgColor
                } else {
                    button.layer.backgroundColor = UIColor.green.cgColor
                }
            }
        } completion: { (Bool) in
            self.initializeUI()
            self.newQuestion()
        }

    }
    
    
    
    
    
    func gameOver() {
        performSegue(withIdentifier: "finishGame", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "finishGame" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.correct = correct
            destinationVC.total = numQuestions
        }
    }
    
    
    @IBAction func unwindToQuestions(unwindSegue: UIStoryboardSegue) {
        reset()
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
