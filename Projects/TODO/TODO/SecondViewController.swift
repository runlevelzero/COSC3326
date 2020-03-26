//
//  SecondViewController.swift
//  TODO
//
//  Created by Ruben S. Ruiz on 2/27/20.
//  Copyright © 2020 Ruben Ruiz. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var newTodoItemTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addButtonPressed(_ sender: Any) {
        
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        
        if let tempItems = itemsObject as? [String] {
            items = tempItems
        }
        
        items.append(newTodoItemTextField.text!)
        
        UserDefaults.standard.set(items, forKey: "items")
        
        newTodoItemTextField.text = ""
        
        self.tabBarController?.selectedIndex = 0
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
              self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        textField.resignFirstResponder()

        
        return true
        
    }
    
}

