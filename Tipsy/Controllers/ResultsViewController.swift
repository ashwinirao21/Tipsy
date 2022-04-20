//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Ashwini on 31/12/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var calculatedResult = "0.0" //default
    var numberOfPeople = 2 //default
    var tipPercentage = 10 //default
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = calculatedResult
        settingsLabel.text = "Split between \(numberOfPeople) people, with \(tipPercentage)% tip."
        
    }
    
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
