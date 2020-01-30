//
//  ViewController.swift
//  Project 2 - Tip Calculator
//
//  Created by Ruben S. Ruiz on 1/23/20.
//  Copyright © 2020 Ruben Ruiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /* Var Bloc //////////////////////////////////////////////// */
    @IBOutlet weak var tipPickerControl: UISegmentedControl!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    /*////////////////////////////////////////////////////////// */
    
    /*////////////////////////////////////////////////////////// */
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    /* Code Bloc /////////////////////////////////////////////// */
    @IBAction func calculateTipBillAmount(_ sender: UIButton) {
        
        let billAmount          = Float(billAmountTextField.text!)
        let gratuityIndex: Int  = tipPickerControl.selectedSegmentIndex
        let gratuity: Float     = (gratuityIndex == 0) ? 0.10 : (gratuityIndex == 1) ? 0.15 : 0.75
        let tipAmount           = billAmount! * gratuity
        let totalBill           = billAmount! + tipAmount
        let billDisplay         = String(format: "$%.2f", totalBill)
        let tipDisplay          = String(format: "$%.2f", tipAmount)

        
        
        billAmountLabel.text    = billDisplay
        tipAmountLabel.text     = tipDisplay
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    /*////////////////////////////////////////////////////////// */

}

