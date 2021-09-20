//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Punnam, Raghav S on 9/20/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var one: UIButton!
    @IBOutlet var two: UIButton!
    @IBOutlet var three: UIButton!
    @IBOutlet var four: UIButton!
    @IBOutlet var five: UIButton!
    @IBOutlet var six: UIButton!
    @IBOutlet var seven: UIButton!
    @IBOutlet var eight: UIButton!
    @IBOutlet var nine: UIButton!
    
    var buttons = [UIButton]()
    var playerOnesTurn = true
    
    var totalTurns = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttons = [one, two, three, four, five, six, seven, eight, nine]
        reset()
    }
    
    func reset() {
        totalTurns = 0
        playerOnesTurn = true
        for (index, button) in buttons.enumerated() {
            button.setTitle(" ", for: .normal)
            button.tag = index
        }
    }
    
    @IBAction func pressButton(sender: UIButton!) {
        let button = buttons[sender.tag]
        if button.titleLabel?.text == " " {
            buttons[sender.tag].setTitle(playerOnesTurn ? "X" : "O", for: .normal)
            playerOnesTurn = !playerOnesTurn
            totalTurns += 1
        }
        
        checkforGameOver()
    }
    
    func checkforGameOver() {
        if (totalTurns == 9) {
            presentGameAlert(message: "Game Over")
        }
    }
    
    func presentGameAlert(message: String) {
        let alert = UIAlertController(title: "Game Over", message: "", preferredStyle: UIAlertController.Style.actionSheet)
        alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default, handler: { _ in self.reset() }))
        self.present(alert, animated: true, completion: nil)
    }
    
    


}

