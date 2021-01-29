//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var calculateBrain = CalculateBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenStartPosition()
    }
    
    func screenStartPosition() {
        unselectTipButtons()
        zeroPctButton.isSelected = true
        splitNumberLabel.text = String (calculateBrain.getSplitValue())
    
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        unselectTipButtons()
        sender.isSelected = true
        let selectedTip = sender.titleLabel?.text
        calculateBrain.selectTip(selectedTip: selectedTip)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        let pesonsForSplit = Int(sender.value)
        calculateBrain.setSplitValue(persons: pesonsForSplit)
        splitNumberLabel.text = String(calculateBrain.getSplitValue())
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        selectUserData()
        calculateBrain.calculateSplitScore()
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    func unselectTipButtons() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    func selectUserData() {
        calculateBrain.setTotalScore(score: Float(billTextField.text ?? "0.0" ))
        
        calculateBrain.setSplitValue(persons: Int(splitNumberLabel.text ?? "2"))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if ( segue.identifier == "goToResults"){
            
            let resultsVC = segue.destination as! ResultsViewController
            resultsVC.totalScore = calculateBrain.getSplitedScore()
            resultsVC.selectedTipOnPersent = calculateBrain.getSelectedPersentTip()
            resultsVC.split = calculateBrain.getSplitValue()
            
        }
    }
    
}

