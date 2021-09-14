//
//  ViewController.swift
//  Destiny
//
//  Created by Punnam, Raghav S on 9/14/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var labelView: UIView!
    @IBOutlet var storyLabel: UILabel!
    
    @IBOutlet var buttonOne: UIButton!
    @IBOutlet var buttonTwo: UIButton!
    
    @IBOutlet var backgroundImage: UIImageView!
    
    var game = Destiny()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initializeUI()
        updateLabels()
    }
    
    func initializeUI() {
        storyLabel.text = "You are in a dark and gloomy forest."
        labelView.layer.cornerRadius = 5
        labelView.layer.masksToBounds = true
        
        buttonOne.layer.cornerRadius = 15
        buttonOne.layer.masksToBounds = true
        
        buttonTwo.layer.cornerRadius = 15
        buttonTwo.layer.masksToBounds = true
    }

    @IBAction func firstChoiceClicked(_ sender: Any) {
        let newCurrentStory = Destiny.stories[game.currentStory].choice1Index
        
        if newCurrentStory != -1 {
            game.currentStory = newCurrentStory
            updateLabels()
        } else {
            showGameOverAlert()
        }
    }
    
    @IBAction func secondChoiceClicked(_ sender: Any) {
        let newCurrentStory = Destiny.stories[game.currentStory].choice2Index
        
        if newCurrentStory != -1 {
            game.currentStory = newCurrentStory
            updateLabels()
        } else {
            showGameOverAlert()
        }
    }
    
    func updateLabels() {
        storyLabel.text = game.getTitle()
        buttonOne.setTitle(game.getChoiceOne(), for: .normal)
        buttonTwo.setTitle(game.getChoiceTwo(), for: .normal)
        
        backgroundImage.image = UIImage(named: game.getImage())
    }
    
    func showGameOverAlert() {
        let alertController = UIAlertController(title: "Game Over!", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Play Again", style: .default))
        self.present(alertController, animated: true, completion: nil)
        
        game.currentStory = 0
        updateLabels()
    }
    
    
}

struct Destiny {
    var currentStory: Int = 0
    
    static let stories = [ //construct Story objects inside the list
        Story(title: "Hey there! You are an individual residing in Storyville city. After a long year of work, you are really excited to take your vacation. Where would you like to go?", choice1: "The Amazon Forest", choice1Index: 1, choice2: "Grand Canyon", choice2Index: 3, image: "buildings"),
        Story(title: "You have decided to go to the Amazon Forest, however, you get stuck and do not know where to go from here. It's pretty dark and scary out, what do you want to do?", choice1: "Let's go farther and see what happens.", choice1Index: 2, choice2: "I change my mind, Grand Canyon pls", choice2Index: 3, image: "forest"),
        Story(title: "Oh no, it seems that you have run into this odd-looking species of flower. Could it be helpful to you?", choice1: "Touch it!", choice1Index: 4, choice2: "I better head back.", choice2Index: 3, image: "flower"),
        Story(title: "The Grand Canyon is so nice. You see a commercial space tour to the moon. It's still in its testing stages though, is it a good idea to get on?", choice1: "Let's do it!", choice1Index: 4, choice2: "I don't feel so good, let's just continue safely.", choice2Index: -1, image: "mountain"),
        Story(title: "Oh god! I've been transported to space!!!! It is honestly pretty nice, though.", choice1: "Stay in space forever :)", choice1Index: -1, choice2: "Let's go back home!", choice2Index: 0, image: "moon")
    ]
    
    func getTitle() -> String {
        return Destiny.stories[currentStory].title
    }
    
    func getChoiceOne() -> String {
        return Destiny.stories[currentStory].choice1
    }
    
    func getChoiceTwo() -> String {
        return Destiny.stories[currentStory].choice2
    }
    
    func getImage() -> String {
        return Destiny.stories[currentStory].image
    }
}

struct Story {
    let title: String
    let choice1: String
    let choice1Index: Int
    let choice2: String
    let choice2Index: Int
    let image: String
}

