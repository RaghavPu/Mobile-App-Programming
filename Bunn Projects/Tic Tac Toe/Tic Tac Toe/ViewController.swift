//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Punnam, Raghav S on 9/20/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var playerOneView: UIView!
    @IBOutlet var playerTwoView: UIView!

    @IBOutlet var buttons: [UIButton]!
    
    var playerOnesTurn = true
    var totalTurns = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        reset()
    }
    
    func reset() {
        totalTurns = 0
        playerOnesTurn = true
        for (index, button) in buttons.enumerated() {
            button.setTitle(" ", for: .normal)
            button.tag = index
        }
        indicatePlayerTurn()
    }
    
    @IBAction func pressButton(sender: UIButton!) {
        let button = buttons[sender.tag]
        
        DispatchQueue.main.async {
            if button.titleLabel?.text == " " {
                self.buttons[sender.tag].titleLabel?.text = self.playerOnesTurn ? "X" : "O"
                self.buttons[sender.tag].setTitle(self.playerOnesTurn ? "X" : "O", for: .normal)
                self.playerOnesTurn = !self.playerOnesTurn
                self.indicatePlayerTurn()
                self.totalTurns += 1
            }

            self.checkforGameOver()
        }
    }
    
    func checkforGameOver() {
        var playerOne: Bool? = nil
        
        // top horizontal
        if checkRow(0, 1, 2) {
            playerOne = setPlayerWin(0)
        }
        
        // middle horizontal
        else if checkRow(3, 4, 5) {
            playerOne = setPlayerWin(3)
        }
        
        // bottom horizontal
        else if checkRow(6, 7, 8) {
            playerOne = setPlayerWin(6)
        }
        
        // left vertical
        else if checkRow(0, 3, 6) {
            playerOne = setPlayerWin(0)
        }
        
        // middle vertical
        else if checkRow(1, 4, 7) {
            playerOne = setPlayerWin(1)
        }
        
        // right vertical
        else if checkRow(2, 5, 8) {
            playerOne = setPlayerWin(2)
        }
        
        // top left diagonal
        else if checkRow(0, 4, 8) {
            playerOne = setPlayerWin(0)
        }
        
        // top right diagonal
        else if checkRow(6, 4, 2) {
            playerOne = setPlayerWin(6)
        }

        // tie
        if playerOne != nil {
            presentGameAlert(message: playerOne! ? "Player 1 Wins" : "Player 2 Wins")
        }
        
        if (totalTurns == 9) {
            presentGameAlert(message: "Tie")
        }
    }
    
    func indicatePlayerTurn() {
        playerOneView.alpha = playerOnesTurn ? 1 : 0.3
        playerTwoView.alpha = !playerOnesTurn ? 1 : 0.3
    }
    
    func presentGameAlert(message: String) {
        let alert = UIAlertController(title: "Game Over", message: message, preferredStyle: UIAlertController.Style.actionSheet)
        alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default, handler: { _ in self.reset() }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func getChar( _ index: Int) -> String {
        let text = buttons[index].titleLabel?.text ?? " "
        return text
    }
    
    func checkRow(_ x: Int, _ y: Int, _ z: Int) -> Bool {
        return getChar(x) == getChar(y) && getChar(y) == getChar(z) && getChar(x) != " "
    }
    
    func setPlayerWin(_ index: Int) -> Bool {
        let playerChar = getChar(index)
        return playerChar == "X"
    }


}

