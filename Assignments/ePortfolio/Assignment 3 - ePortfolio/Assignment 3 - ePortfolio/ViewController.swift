//
//  ViewController.swift
//  Assignment 3 - ePortfolio
//
//  Created by Turing on 3/5/20.
//  Copyright © 2020 Ruben Ruiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var goToSectionLabel: UILabel!
    @IBOutlet weak var goToSectionSlider: UISlider!
    @IBOutlet weak var embeddedView: UIView!
    let sectionNames: [String] = ["Degrees", "Jobs/Internships", "Programming Skills", "Courses Taken", "Transcripts",  "Certifications/Licenses", "Scholarships", "Awards", "Activities", "Presentations and Participations", "Trips", "Hobbies", "About Me", "Contact Info"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        
        goToSectionLabel.text = "GoToSection: \(sectionNames[Int(goToSectionSlider.value)])"
        
    }
    @IBAction func goToSectionButtonPressed(_ sender: UIButton) {

        let tableViewController: UITableViewController = self.children[0] as! UITableViewController
        let tableView = tableViewController.tableView
        tableView?.scrollToRow(at: getRowIndex(categoryNum: Int(goToSectionSlider.value)), at: UITableView.ScrollPosition.top, animated: true)
        
    }
    func getRowIndex(categoryNum: Int) -> IndexPath {
        return IndexPath(row: 0, section: categoryNum)
    }
}

