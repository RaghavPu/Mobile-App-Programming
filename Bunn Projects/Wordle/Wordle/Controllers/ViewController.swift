//
//  ViewController.swift
//  Wordle
//
//  Created by Punnam, Raghav S on 3/30/22.
//

import UIKit

class ViewController: UIViewController {

    var game: Game = Game()
    
    @IBOutlet var gameFrames: [UILabel]!
    @IBOutlet var keyboardBtns: [UIButton]!
    @IBOutlet var frameViews: [UIView]!
    @IBOutlet var keyboardViews: [UIView]!
    
    var screenSize: CGRect = UIScreen.main.bounds

    var timerCount = 0
    var timer = Timer()
    var celebrationEmojis = ["🥳", "🎉", "👏", "🎊"]

    
    var cursor: Int = 0
    var line: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initializeUI()
        
        print(game.correctWord)
    }
    
    func resetCursor() {
        cursor = 0
        line = 0
    }
    
    func resetGame() {
        resetCursor()
        game.newWord()
        updateLettersUI()
        initializeUI()
    }
    
    func initializeUI() {
        for i in 0..<gameFrames.count {
            gameFrames[i].text = ""
            frameViews[i].backgroundColor = .systemGray6
        }
    }
    
    @IBAction func letterClicked(_ sender: UIButton) {
        if cursor < 5 {
            getFrame().text = sender.currentTitle
            cursor += 1
        }
    }
    

    @IBAction func enterWord(_ sender: Any) {
        if cursor < 5 {
            sendAlert(title: "Error", message: "Not Full Word")
        } else if game.checkWord(word: getCurrentWord()) {
            logWord()
        } else {
            sendAlert(title: "Error", message: "Word Not in Dictionary")
        }
    }
    
    @IBAction func deleteLetter(_ sender: Any) {
        cursor = max(0, cursor - 1)
        getFrame().text = ""
    }
    
    func sendAlert(title: String, message: String) {
        // Create new Alert
        let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        //Add OK button to a dialog message
        dialogMessage.addAction(ok)
        // Present Alert to
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    func newGame(title: String, message: String) {
        let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            self.resetGame()
        })
        
        //Add OK button to a dialog message
        dialogMessage.addAction(ok)
        // Present Alert to
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    func getFrame() -> UILabel {
        return gameFrames[line * 5 + cursor]
    }
    
    func getCurrentWord() -> String {
        var word = ""
        for frameNum in (line * 5)..<((line + 1) * 5) {
            word += gameFrames[frameNum].text!
        }
        
        return word
    }
    
    func logWord() {
        let word = getCurrentWord()
        game.checkLetters(word: word)
        updateLettersUI()
        
        if word == game.correctWord {
            celebrateGoal()
        } else {
            line += 1
            cursor = 0
            if line >= 6 {
                newGame(title: "Game Over", message: "The word was \(game.correctWord)")
            }
        }
    }
    
    func updateLettersUI() {
        for frameNum in (line * 5)..<((line + 1) * 5) {
            UILabel.transition(with: frameViews[frameNum], duration: 0.5, options: [.transitionFlipFromTop], animations: nil, completion: nil)
            frameViews[frameNum].backgroundColor = game.letters[gameFrames[frameNum].text!]
        }
        
        
        for key in 0..<keyboardBtns.count {
            if game.letters[keyboardBtns[key].currentTitle!] != nil {
                keyboardViews[key].backgroundColor = game.letters[keyboardBtns[key].currentTitle!]
            } else {
                keyboardViews[key].backgroundColor = .systemGray6
            }
        }
    }
    
    func celebrateGoal() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        let message = UIAlertController(title: "Correct Answer", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Success!", style: .default) { (UIAlertAction) in
            self.timer.invalidate()
            self.timerCount = 0
            self.resetGame()
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

