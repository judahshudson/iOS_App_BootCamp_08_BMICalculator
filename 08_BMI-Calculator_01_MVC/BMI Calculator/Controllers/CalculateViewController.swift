//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(Int(sender.value))
        weightLabel.text = "\(weight)kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let height = heightSlider.value
        let weight = weightSlider.value
        
        //calculatorBrain.calculateBmi(height: height, weight: weight)
        calculatorBrain.calculateBmi(height, weight)
        
        //fast easy connect to SecondViewController via Main.storyboard
        self.performSegue(withIdentifier: "goToResults", sender: self)
       
        /*
         create SecondViewController manually
        let secondVC = SecondViewController
        secondVC.bmiValue = String(format: "%.1f", bmi)
    
        self.present(secondVC, animated: true, completion: nil)
        */
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" { //ensure correct segue
            //downcasting (narrow down exact data type) from UIViewController (superclass) down to ResultsViewController (subclass)
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = "0.0"
            destinationVC.bmiValue = calculatorBrain.getBmiValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

