//
//  ViewController.swift
//  Whack-a-Mole
//
//  Created by Punnam, Raghav S on 9/2/21.
//

import UIKit

class ViewController: UIViewController {
    
    var screenWidth = 0
    var screenHeight = 0
    
    var timer = Timer()
    
    var score = 0;
    var scoreLabel = UILabel()
    var field = UILabel()
    
    var mole = UIButton()
    
    var xStart: Int = 0
    var yStart: Int = 0
    var xEnd: Int = 0
    var yEnd: Int = 0

    var time: Double = 2.0;
    var timerSpeed = 2.0;
    var timeLabel = UILabel();
    
    var startButton = UIButton();
    
    var gameStarted = false;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let screenBounds: CGRect = UIScreen.main.bounds
        screenWidth = Int(screenBounds.width)
        screenHeight = Int(screenBounds.height)
        
        print("Screen width = \(screenWidth) , \(screenHeight)")
        

        initializeScoreLabel()
        initializeField()
        initializeMoleButton()
        initializeTimerLabel()
        initializeStartButton()
    }

    func initializeScoreLabel() {
        scoreLabel.frame = CGRect(x: 10, y: 40, width: 100, height: screenHeight / 10)
        scoreLabel.text = "Score: \(score)"
        view.addSubview(scoreLabel)
        self.view = view
    }
    
    func initializeField() {
        field.frame = CGRect(x: scoreLabel.frame.origin.x,
                             y: scoreLabel.frame.origin.y + scoreLabel.frame.size.height,
                             width: CGFloat(screenWidth) - scoreLabel.frame.origin.x * 2,
                             height: CGFloat(screenHeight) - scoreLabel.frame.size.height - scoreLabel.frame.origin.y - 50)
        field.backgroundColor = .green
        field.layer.cornerRadius = 10;
        field.layer.masksToBounds = true
        view.addSubview(field)
        self.view = view
    }
    
    func initializeMoleButton() {
        mole.frame = CGRect(x: field.frame.origin.x + 30, y: field.frame.origin.y + 30, width: 60, height: 60);
        let moleImg = UIImage(named: "mole")
        mole.setImage(moleImg, for: .normal)
        mole.addTarget(self, action: #selector(hitMole(_:)), for: .touchUpInside)
        
        xStart = Int(field.frame.origin.x + 30)
        yStart = Int(field.frame.origin.y + 30)
        xEnd = Int(field.frame.origin.x + field.frame.size.width - 60)
        yEnd = Int(field.frame.origin.y + field.frame.size.height - 60)
        
        
        view.addSubview(mole)
        self.view = view;
    }
    
    @objc func hitMole(_ sender : UIButton) {
        if !gameStarted {
            UIView.animate(withDuration: 0.5, animations: {self.startButton.alpha = 0}, completion: { finished in self.startButton.isHidden = true})
                
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerFunction(_:)), userInfo: nil, repeats: true)
            
            gameStarted = true
        } else {
            print("Got hit!")
            score += 1
            scoreLabel.text = "Score: \(score)"
            reset()
        }
    }
    
    func initializeTimerLabel() {
        timeLabel.frame = CGRect(x: screenWidth - 100, y: Int(scoreLabel.frame.origin.y), width: 100, height: screenHeight / 10)
        timeLabel.text = "Time: \(String(format: "%.1f", time))"
        view.addSubview(timeLabel)
        self.view = view
    }
    
    func initializeStartButton() {
        startButton.frame = CGRect(x: mole.frame.origin.x + mole.frame.size.width + 10,
                                   y: mole.frame.origin.y + CGFloat((30) / 2),
                                   width: 150,
                                   height: 30)
        startButton.backgroundColor = .white
        startButton.setTitleColor(.black, for: .normal)
        startButton.setTitle("Whack the mole to begin!", for: .normal)
        startButton.titleLabel?.font = .systemFont(ofSize: 10)
        startButton.layer.cornerRadius = 10
        startButton.layer.masksToBounds = true
        view.addSubview(startButton)
        self.view = view;
    }
    
    @objc func timerFunction(_ sender: UIButton) {
        time -= 0.1
        timeLabel.text = "Time: \(String(format: "%.1f", time))"

        if time <= 0.1 {
            score -= 1;
            scoreLabel.text = "Score: \(score)"
            reset()
        }
    }
    
    
    func reset() {
        timerSpeed = max(timerSpeed - 0.1, 0.6)
        let x = Int.random(in: xStart...xEnd)
        let y = Int.random(in: yStart...yEnd)
        mole.frame.origin.x = CGFloat(x);
        mole.frame.origin.y = CGFloat(y);
        time = timerSpeed
    }
    
}



