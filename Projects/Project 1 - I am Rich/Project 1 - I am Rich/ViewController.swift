//
//  ViewController.swift
//  Project 1 - I am Rich
//
//  Created by Turing on 1/21/20.
//  Copyright © 2020 Ruben Ruiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnStahpIt(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "I am Rich U R Not", message: "NO!!", preferredStyle: UIAlertController.Style.alert)
        
        alertController.addAction(UIAlertAction(title: "AWWWWWwwwWWwWWwWwWWWWWwwWW :(", style: UIAlertAction.Style.default, handler: nil))
        
        present(alertController, animated: true, completion: nil)
        
        
    }
    
}

