//
//  ViewController.swift
//  Business Card
//
//  Created by Punnam, Raghav S on 9/28/21.
//

import UIKit

class ViewController: UIViewController {

    var profileImage = UIImageView()
    var profileLabel = UILabel()
    
    var screenWidth = 0, screenHeight = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        screenWidth = Int(view.frame.width)
        screenHeight = Int(view.frame.height)
        
        initializeImage()
        initializeProfileLabel()
    }
    
    func initializeImage() {
        
        profileImage.frame = CGRect(x: (screenWidth - 150) / 2, y: 150, width: 150, height: 150)
        profileImage.image = UIImage(named: "profile")
        profileImage.contentMode = .scaleAspectFill
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.layer.borderColor = UIColor.lightGray.cgColor
        profileImage.layer.borderWidth = 1
        profileImage.clipsToBounds = true
        
        view.addSubview(profileImage)
    }
    
    func initializeProfileLabel() {
        profileLabel.frame = CGRect(x: profileImage.frame.midX, y: profileImage.frame.maxY + 50, width: CGFloat(screenWidth), height: 50)
        profileLabel.text = "Raghav Punnam"
        profileLabel.textAlignment = .center
        profileLabel.font = UIFont(name: "HelveticaNeue", size: 30
        )
        profileLabel.center.x = view.center.x
        
        view.addSubview(profileLabel)
    }


}

