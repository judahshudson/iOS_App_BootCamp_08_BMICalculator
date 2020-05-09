//
//  CalculateBrain.swift
//  BMI Calculator
//
//  Created by Judah Hudson on 2/8/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    func getBmiValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0) //nil coalescing operator
    }
    
    //mutating func calculateBmi(height: Float, weight: Float) {
    mutating func calculateBmi(_ height: Float, _ weight: Float) {
        let bmiValue = weight / pow(height, 2) //(height*height)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more protein & carbs", color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
        } else if bmiValue <= 24.9 {
            bmi = BMI(value: bmiValue, advice: "Keep up the good work", color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
        } else if bmiValue > 24.9 {
            bmi = BMI(value: bmiValue, advice: "Put down the fork", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
        }
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "default Advice"
    }
    
    func getColor() ->  UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    
}
