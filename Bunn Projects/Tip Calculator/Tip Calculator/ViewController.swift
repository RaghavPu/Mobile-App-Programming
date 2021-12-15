//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Punnam, Raghav S on 12/1/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var tip: UILabel!
    @IBOutlet var total: UILabel!
    @IBOutlet var billTextField: UITextField!
    @IBOutlet var tipSegmentedControl: UISegmentedControl!
    
    var tips = [15, 18, 20, 25]
    
    var bill: Double = 0
    var tipAmt: Double = 0.15
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeBillAmount(_ sender: UITextField) {
        if let billAmt = Double(sender.text ?? "") {
            bill = billAmt
        } else {
            bill = 0
        }
        calculate()
    }
    
    @IBAction func changedTipAmount(_ sender: UISegmentedControl) {
        tipAmt = Double(tips[sender.selectedSegmentIndex]) / 100
        calculate()
    }
    
    
    func calculate() {
        let finalTip = bill * tipAmt
        let finalTotal = bill + finalTip
        tip.text = String(format: "%.2f", finalTip)
        total.text = String(format: "%.2f", finalTotal)
    }
    
    @IBAction func reset(_ sender: Any) {
        bill = 0
        tipAmt = 0.15
        billTextField.text = ""
        tipSegmentedControl.selectedSegmentIndex = 0
        calculate()
    }
    
    

}

