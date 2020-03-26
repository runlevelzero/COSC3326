//
//  SecurePageViewController.swift
//  Project 3 - Secure Login
//
//  Created by Ruben S. Ruiz on 2/6/20.
//  Copyright © 2020 Ruben Ruiz. All rights reserved.
//

import UIKit

class SecurePageViewController: UIViewController {
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC : ViewController = segue.destination as! ViewController
        destinationVC.previousUser = "BYE \(firstNameTextField) \(lastNameTextField)"
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
