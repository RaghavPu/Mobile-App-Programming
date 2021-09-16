//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Punnam, Raghav S on 9/16/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var answerLabel: UILabel!
    
    let answers = [
        "It is certain",
        "It is decidedly so.",
        "Without a doubt.",
        "Yes definitely.",
        "You many rely on it.",
        "As I see it, yes.",
        "Most likely.",
        "Outlook good.",
        "Yes.",
        "Signs point to yes.",
        "Reply hazy, try again.",
        "Ask again later.",
        "Better not tell you know.",
        "Cannot predict now.",
        "Concentrate and ask again.",
        "Don't count on it.",
        "My reply is no.",
        "My sources say no.",
        "Outlook not so good.",
        "Very doubtful."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        answerLabel.alpha = 0.5
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            UIView.animate(withDuration: 5, animations: {self.answerLabel.alpha = 0}, completion: {finished in })
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        answerLabel.text = answers.randomElement()
        if motion == .motionShake {
            UIView.animate(withDuration: 5, animations: {self.answerLabel.alpha = 1}, completion: { finished in self.answerLabel.isHidden = false})

        }
    }


}

