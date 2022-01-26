//
//  AccountTabBarController.swift
//  Voluntracker
//
//  Created by Punnam, Raghav S on 1/26/22.
//

import UIKit

class AccountTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Loaded")
        let username = UserDefaults.standard.string(forKey: "loggedInUser")
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Hello, " + username!
        
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
