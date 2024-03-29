//
//  ViewController.swift
//  BullsEye
//
//  Created by Ana Paula da Silva on 13/08/19.
//  Copyright © 2019 Ana Paula da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = Int(slider.value.rounded())
        startNewRound()
    }

    @IBAction func showAlert(_ sender: Any) {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        let title: String
        
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        score += points
        
        let message = "You scored \(points) points."
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: { action in self.startNewRound() })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func startOver(_ sender: Any) {
        score = 0
        round = 0
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let rounded = slider.value.rounded()
        currentValue = Int(rounded)
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

