//
//  ViewController.swift
//  Trivia Game
//
//  Created by Punnam, Raghav S on 2/11/22.
//

import UIKit

class SetupViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var topicPicker: UIPickerView!
    @IBOutlet var questionPicker: UIPickerView!
    
    let topicArr = Array(Questions.data.keys)
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topicPicker.dataSource = self
        questionPicker.dataSource = self
        
        topicPicker.delegate = self
        questionPicker.delegate = self
        // Do any additional setup after loading the view.
        
        initialize()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == topicPicker { return topicArr.count }
        else { return 30 }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == topicPicker {
            return topicArr[row]
        } else {
            return "\(row + 1)"
        }
    }
    
    func initialize() {
        userDefaults.setValue(topicArr[topicPicker.selectedRow(inComponent: 0)], forKey: "Topic")
        userDefaults.setValue(Int(questionPicker.selectedRow(inComponent: 0)) + 1, forKey: "Questions")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        initialize()
        print(userDefaults.string(forKey: "Topic")!)
        print(userDefaults.integer(forKey: "Questions"))
    }

}

