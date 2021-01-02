//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatedSplit: Float = 0.0
    
    var tipPercentage: Float = 0.0

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    

    @IBAction func tipChanged(_ sender: UIButton!) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        billTextField.endEditing(true)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
       
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        
        if zeroPctButton.isSelected {
            tipPercentage = 0.0
        }
        if tenPctButton.isSelected {
            tipPercentage = 0.1
        }
        if twentyPctButton.isSelected {
            tipPercentage = 0.2
        }
        
        guard let floatBillText = Float(billTextField.text ?? "0") else {return}
        guard let floatSplitNumberLabel = Float(splitNumberLabel.text ?? "0") else {return}
        
        calculatedSplit = (floatBillText + floatBillText * tipPercentage) / floatSplitNumberLabel
        print(String(format: "%0.2f", calculatedSplit))
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
       
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = String(calculatedSplit)
            destinationVC.settings = String("Split between \(splitNumberLabel.text!) people with an added \(tipPercentage * 100)% tip")
            
        }
    }
        
        
    
    
}

