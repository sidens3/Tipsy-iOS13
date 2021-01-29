//
//  CalculateBrain.swift
//  Tipsy
//
//  Created by Михаил Зиновьев on 28.01.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CalculateBrain {
    var billData = BillData()
    
    mutating func selectTip(selectedTip : String?) {
        setSelectedPersentTip(selectedTip: selectedTip)
        switch selectedTip {
        case "10%":
            print(1)
            billData.tip = 0.1
        case "20%":
            billData.tip = 0.2
            print(2)
        default:
            print(3)
            billData.tip = 0.0
        }
    }
    
    func getTip() -> Float {
        return billData.tip ?? 0.0
    }
    
    mutating func setSelectedPersentTip(selectedTip : String?) {
        billData.selectedTip = selectedTip ?? "0%"
    }
    
    func getSelectedPersentTip() -> String? {
        return billData.selectedTip
    }
    
    func getSplitValue() -> Int {
        return billData.splitValue ?? 2
    }
    
    mutating func setSplitValue(persons splitValue: Int?) {
        billData.splitValue = splitValue ?? 2
    }
    
    mutating func setTotalScore (score : Float?){
        billData.totalScore = score
    }
    
    mutating func calculateSplitScore(){
        let totalScore = billData.totalScore ?? 0.0
        let splitValue = Float(billData.splitValue ?? 2)
        let tip = billData.tip ?? 0.0
        
        let tipScore = totalScore * tip
        let splitScore =  (totalScore + tipScore) / splitValue
        billData.splitScore =  splitScore
    }
    
    func getSplitedScore() -> Float {
        return billData.splitScore ?? 0
    }
}
