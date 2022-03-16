//
//  ViewController.swift
//  Captcha
//
//  Created by Punnam, Raghav S on 3/14/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageViews: [CaptchaImageView]!
    var gestureRecognizers: [UITapGestureRecognizer] = []
    var imageNames: [String] = []
    
    @IBOutlet var promptText: UILabel!
    
    var correct: Int = 0
    var numberOfTries: Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0..<imageViews.count {
            gestureRecognizers.append(UITapGestureRecognizer(target: self, action: #selector(gestureFired(_:))))
            gestureRecognizers[i].numberOfTapsRequired = 1;
            imageViews[i].addGestureRecognizer(gestureRecognizers[i]);
            imageViews[i].isUserInteractionEnabled = true;
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadImages()
        
        correct = Int.random(in: 0..<imageViews.count)
        promptText.text = imageNames[correct]
    }
    
    func loadImages() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath! + "/Images"

        do {
            var items = try fm.contentsOfDirectory(atPath: path)
            
            for imageView in imageViews {
                let randomIndex = Int.random(in: 0..<items.count)
                let item = items.remove(at: randomIndex)
                imageView.image = UIImage(named: item)
                imageNames.append(String(item.prefix(item.count - 4)))
            }
        } catch {
            print("Unable to read captcha images.")
        }
    }

    @objc func gestureFired(_ gesture: UITapGestureRecognizer) {
        if numberOfTries <= 0 {
            performSegue(withIdentifier: "accountBlockedToImage", sender: self)
        }
        
        let answerClicked = gestureRecognizers.firstIndex(of: gesture) ?? -1
        if correct == answerClicked {
            performSegue(withIdentifier: "imageToSound", sender: self)
        } else {
            imageViews[answerClicked].shake()
            numberOfTries -= 1
            if numberOfTries <= 0 {
                performSegue(withIdentifier: "accountBlockedToImage", sender: self)
            }
        }
    }
    
}

