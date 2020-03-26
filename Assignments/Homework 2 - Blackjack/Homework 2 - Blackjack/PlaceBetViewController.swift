//
//  PlaceBetViewController.swift
//  Homework 2 - Blackjack
//
//  Created by Ruben Ruiz on 2/20/20.
//  Copyright © 2020 rubenruiz.org. All rights reserved.
//

import UIKit

class PlaceBetViewController: UIViewController {

    @IBOutlet weak var betSlider: UISlider!
    @IBOutlet weak var betLabel: UILabel!
    
    var maxValue: Float = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        betSlider.maximumValue = maxValue

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC : ViewController = segue.destination as! ViewController
        destinationVC.bets = betSlider.value
        destinationVC.winnings = maxValue
        destinationVC.betPlaced = true
    }

    @IBAction func sliderMoved(_ sender: Any) {
        betLabel.text = String(format:"$%.0f", betSlider.value)
    }
    
    @IBAction func betPlaced(_ sender: Any) {
        if(betSlider.value > 0) {
            
            performSegue(withIdentifier: "setBetSegue", sender: self)
            
        }
        else {
            
            let alertController = UIAlertController(title: "Place your bet.", message: "Hold on there boss, you need to place your bet first!", preferredStyle: UIAlertController.Style.alert)

            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

            present(alertController, animated: true, completion: nil)
            
        }
        
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
