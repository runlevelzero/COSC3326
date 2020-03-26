//
//  ViewController.swift
//  Project 5 - Throwing Dice
//
//  Created by Ruben S. Ruiz on 2/13/20.
//  Copyright © 2020 Ruben Ruiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftDiceImage: UIImageView!
    @IBOutlet weak var rightDiceImage: UIImageView!
    let diceImageNames = ["Dice-1","Dice-2","Dice-3","Dice-4","Dice-5","Dice-6"]
    var randomNum: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        leftDiceImage.layer.cornerRadius = leftDiceImage.frame.size.width / 8
        rightDiceImage.layer.cornerRadius = leftDiceImage.frame.size.width / 8
        leftDiceImage.clipsToBounds = true
        rightDiceImage.clipsToBounds = true
        
        rollDiceAndChangeTheImagesOnTheDisplayedDice()
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        rollDiceAndChangeTheImagesOnTheDisplayedDice()
        
    }
    
    func rollDiceAndChangeTheImagesOnTheDisplayedDice() {
        
        randomNum = Int(arc4random_uniform(6))
        leftDiceImage.image = UIImage(named: diceImageNames[randomNum])
        randomNum = Int(arc4random_uniform(6))
        rightDiceImage.image = UIImage(named: diceImageNames[randomNum])
        
        
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        if motion == .motionShake {
            rollDiceAndChangeTheImagesOnTheDisplayedDice()
        }
        
    }
    
}

