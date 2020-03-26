//
//  SettingsViewController.swift
//  Project 3 - SOOOOOPER BOWL
//
//  Created by Ruben S. Ruiz on 1/30/20.
//  Copyright © 2020 Ruben Ruiz. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var brightnessSlider: UISlider!
    @IBOutlet weak var brightnessLabel: UILabel!
    @IBAction func changeBrightness(_ sender: UISlider) {
        brightnessLabel.text = "\(Int(brightnessSlider.value))%"
        UIScreen.main.brightness = CGFloat(brightnessSlider.value/100)
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
