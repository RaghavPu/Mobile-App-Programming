//
//  ViewController.swift
//  Poor
//
//  Created by Punnam, Raghav S on 8/27/21.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var titleText: UILabel!
    @IBOutlet var subtitleText: UILabel!
    @IBOutlet var captionText: UILabel!
    
    
    @IBOutlet var indicatorImage: UIImageView!
    
    var isRich = true;
    
    var titleTexts = ["I am Rich", "I am Poor"]
    var subtitleTexts = ["I have all the money in the world.", "I wish I had more money."]
    var captionTexts = ["I bet I got more diamonds than you.", "I got more rock than anyone else, for sure."]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func changeData() {
        let dataIndex = isRich ? 0 : 1
        titleText.text = titleTexts[dataIndex];
        subtitleText.text = subtitleTexts[dataIndex];
        captionText.text = captionTexts[dataIndex];
        
        indicatorImage.image = UIImage(named: isRich ? "diamond" : "rock")
        
        let textColor: UIColor = isRich ? .black : .white
        (titleText.textColor, subtitleText.textColor, captionText.textColor) = (textColor, textColor, textColor)
    }

    @IBAction func changeFinanceState(_ sender: Any) {
        isRich.toggle()
        view.backgroundColor = isRich ? .white : .black
        changeData()
    }
    
}

