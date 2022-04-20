//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    
    @IBOutlet weak var billtextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipvalue = 0.10 //default is 10
    var numberOfPeople = 2//default is 2
    var billTotal = 0.0 //empty text field
    var finalSplitBillAmount : String = "0.0"

    @IBAction func tipChanged(_ sender: UIButton) {
        
        billtextField.endEditing(true) //dismiss keyboard

        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false //set all to false and then select the selected button
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!

        let buttonTitleExceptPercentSymbol = String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(buttonTitleExceptPercentSymbol)!
        tipvalue = buttonTitleAsNumber / 100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billAmount = billtextField.text!
        
        if billAmount != "" {
            billTotal = Double(billAmount)!
            
            let splitBillWithTip = billTotal * (1 + tipvalue) / Double(numberOfPeople)
            finalSplitBillAmount = String(format: "%.2f",splitBillWithTip)
            print(finalSplitBillAmount)
            
            self.performSegue(withIdentifier: "goToResults", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.calculatedResult = finalSplitBillAmount
            destinationVC.numberOfPeople = numberOfPeople
            destinationVC.tipPercentage = Int(tipvalue * 100)
        }
    }
}

