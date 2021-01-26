//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    var bmiValue: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightSlider.value = heightSlider.maximumValue / 2
        weightSlider.value = weightSlider.maximumValue / 2
    }
    

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        guard let roundedHeight = Float(String(format: "%.2f", sender.value)) else { return }
        heightLabel.text = "\(roundedHeight)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let roundedWeight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(roundedWeight)kg"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        let bmi = weight / pow(height, 2)
        print (bmi)
        
        bmiValue = String(format: "%.1f", bmi)
    
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = bmiValue
        }
    }
}

