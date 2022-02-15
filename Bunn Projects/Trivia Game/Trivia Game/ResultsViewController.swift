//
//  ResultsViewController.swift
//  Trivia Game
//
//  Created by Punnam, Raghav S on 2/11/22.
//

import UIKit

class ResultsViewController: UIViewController {

    var correct = 0
    var total = 0
    
    @IBOutlet var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scoreLabel.text = "You got \(correct)/\(total) correct."
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
