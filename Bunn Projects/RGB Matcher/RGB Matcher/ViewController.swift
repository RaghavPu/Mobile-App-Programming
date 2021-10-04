//
//  ViewController.swift
//  RGB Matcher
//
//  Created by Punnam, Raghav S on 10/4/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myColor: UIView!
    @IBOutlet var matchColor: UIView!
    
    @IBOutlet var rVal: UISlider!
    @IBOutlet var gVal: UISlider!
    @IBOutlet var bVal: UISlider!
    
    @IBOutlet var timerLabel: UILabel!
    var timer = Timer()
    var time = 10.0
    
    
    var gameStarted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        resetGame()
    }
    
    func initializeUI() {
        myColor.layer.borderWidth = 1
        myColor.layer.borderColor = UIColor.black.cgColor
        
        matchColor.layer.borderWidth = 1
        matchColor.layer.borderColor = UIColor.black.cgColor
    }

    @IBAction func colorChanged(_ sender: Any) {
        if !gameStarted { startGame() }
        myColor.backgroundColor = UIColor(cgColor: CGColor(red: CGFloat(rVal.value), green: CGFloat(gVal.value), blue: CGFloat(bVal.value), alpha: 1))
    }
    
    func startGame() {
        gameStarted = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        time -= 0.1
        let printTime = ceil(time * 10.0) / 10.0
        timerLabel.text = "Time: \(printTime)s"
        if (time <= 0) {
            timer.invalidate()
            presentAlert()
        }
    }
    
    func presentAlert() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        matchColor.backgroundColor?.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        var myRed: CGFloat = 0
        var myGreen: CGFloat = 0
        var myBlue: CGFloat = 0
        var myAlpha: CGFloat = 0
        myColor.backgroundColor?.getRed(&myRed, green: &myGreen, blue: &myBlue, alpha: &myAlpha)
        
        let diff = sqrt(pow(red - myRed, 2) + pow(green - myGreen, 2) + pow(blue - myBlue, 2))
        let score = round((1 - diff) * 100)
        
        print(red)
        print(green)
        print(blue)

        let alert = UIAlertController(title: "Game Over", message: "Score: \(score)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: { (UIAlertAction) in
            self.resetGame()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func resetGame() {
        time = 10
        gameStarted = false
        let newR = Double.random(in: 0.0...1.0)
        let newG = Double.random(in: 0.0...1.0)
        let newB = Double.random(in: 0.0...1.0)
        matchColor.backgroundColor = UIColor(cgColor: CGColor(red: CGFloat(newR), green: CGFloat(newG), blue: CGFloat(newB), alpha: 1))
    }
    
    func setSliders() {
        rVal.value = Float(Double.random(in: 0.0...1.0))
        gVal.value = Float(Double.random(in: 0.0...1.0))
        bVal.value = Float(Double.random(in: 0.0...1.0))
        myColor.backgroundColor = UIColor(cgColor: CGColor(red: CGFloat(rVal.value), green: CGFloat(gVal.value), blue: CGFloat(bVal.value), alpha: 1))
    }
    
    
    
    
}

