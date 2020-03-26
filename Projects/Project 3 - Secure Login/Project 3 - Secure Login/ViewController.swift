//
//  ViewController.swift
//  Project 3 - Secure Login
//
//  Created by Ruben S. Ruiz on 2/6/20.
//  Copyright © 2020 Ruben Ruiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var incorrectPasswordLabel: UILabel!
    
    @IBOutlet weak var headerLabel: UILabel!
    
    var previousUser: String = "APP"
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.text = previousUser
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var greeterLabel: UILabel!

    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
              self.view.endEditing(true)
    }
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        if(usernameTextField.text == "username" && passwordTextField.text == "password") {
            print("test")
            performSegue(withIdentifier: "loginSuccess", sender: self)
        }
        else {
            
            incorrectPasswordLabel.isHidden = false
            print("test2")
            var colorVal: CGFloat = 1.0
            while colorVal >= 0.0 {
                incorrectPasswordLabel.textColor = UIColor(red: 1.0, green: colorVal, blue: colorVal, alpha: 1.0)
                colorVal -= 0.0000001
            }
            
            
        }
    }
}

