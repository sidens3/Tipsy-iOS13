//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Михаил Зиновьев on 28.01.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var totalScore : Float?
    var selectedTipOnPersent : String?
    var split : Int?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = String(totalScore ?? 0.0)
        settingsLabel.text = "Split between \(String(split ?? 2)) people, with \(selectedTipOnPersent ?? "0%") tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
