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
    var showContactBtn = UIButton()
    var showContacts = false
    
    var contactInfo = [UILabel]()
    
    
    var screenWidth = 0, screenHeight = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        screenWidth = Int(view.frame.width)
        screenHeight = Int(view.frame.height)
        
        initializeImage()
        initializeProfileLabel()
        initializeShowContactButton()
        initializeContactLabels()
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
        profileLabel.frame = CGRect(x: profileImage.frame.midX, y: profileImage.frame.maxY + 20, width: CGFloat(screenWidth), height: 50)
        profileLabel.text = "Raghav Punnam"
        profileLabel.textAlignment = .center
        profileLabel.font = UIFont(name: "Courier New", size: 30)
        profileLabel.center.x = view.center.x
        
        view.addSubview(profileLabel)
    }
    
    func initializeShowContactButton() {
        showContactBtn.frame = CGRect(x: profileLabel.frame.minX, y: profileLabel.frame.maxY + 50, width: CGFloat(screenWidth) - 50, height: 50)
        showContactBtn.setTitle("Show Contact Info", for: .normal)
        showContactBtn.backgroundColor = .blue
        showContactBtn.center.x = profileLabel.center.x
        showContactBtn.layer.cornerRadius = 25
        showContactBtn.layer.masksToBounds = true
        showContactBtn.addTarget(self, action: #selector(clickShareButton(_:)), for: .touchUpInside)
        
        view.addSubview(showContactBtn)
        self.view = view
    }
    
    func initializeContactLabels() {
        contactInfo.append(UILabel())
        contactInfo[0].frame = CGRect(x: showContactBtn.frame.minX, y: showContactBtn.frame.maxY + 80, width: CGFloat(screenWidth), height: 100)
        contactInfo[0].text = "raghavsrisurya@gmail.com"
        
        contactInfo.append(UILabel())
        contactInfo[1].frame = CGRect(x: contactInfo[0].frame.minX, y: contactInfo[0].frame.maxY + 10, width: CGFloat(screenWidth), height: 100)
        contactInfo[1]
            .text = "(650) 305-5772"
        
        for contact in contactInfo {
            contact.isHidden = true
            contact.center.x = showContactBtn.center.x
            contact.backgroundColor = .darkGray
            contact.font = UIFont(name: "Courier New", size: 20)
            contact.textAlignment = .center
            contact.textColor = .white
            contact.layer.cornerRadius = 15
            contact.layer.masksToBounds = true
            view.addSubview(contact)
        }
        
        
    }
    
    @objc func clickShareButton(_ sender: UIButton) {
        for contact in contactInfo {
            contact.isHidden = showContacts
        }
        
        showContacts = !showContacts
        showContactBtn.setTitle((showContacts ? "Hide" : "Show") + " Contact Info", for: .normal)
    }


}

