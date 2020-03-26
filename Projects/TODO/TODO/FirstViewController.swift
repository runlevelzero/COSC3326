//
//  FirstViewController.swift
//  TODO
//
//  Created by Ruben S. Ruiz on 2/27/20.
//  Copyright © 2020 Ruben Ruiz. All rights reserved.
//

import UIKit

var items: [String] = []

class FirstViewController: UIViewController, UITableViewDataSource,  UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    @IBOutlet weak var todoTableView: UITableView!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
            
        }
        
        todoTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
            items.remove(at: indexPath.row)
            
            todoTableView.reloadData()
            
            UserDefaults.standard.set(items, forKey: "items")
            
        }
        
        
    }


}

