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
    
    var currentValue:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = Int(slider.value.rounded())
    }

    @IBAction func showAlert(_ sender: Any) {
        let message = "The value of the slider is now: \(currentValue)"
        let alert = UIAlertController(title: "Hello, World!", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let rounded = slider.value.rounded()
        currentValue = Int(rounded)
    }
}

