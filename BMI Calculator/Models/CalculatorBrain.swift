//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Михаил Зиновьев on 27.01.2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit


struct CalculatorBrain {
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue = weight / pow(height, 2)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advise: "Eat more pies!", color: #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1))
        } else if bmiValue < 24.9{
            bmi = BMI(value: bmiValue, advise: "Fit as a fiddle!", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        } else{
            bmi = BMI(value: bmiValue, advise: "Eat less pies!", color: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))
        }
    }
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advise ?? "No Advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}
