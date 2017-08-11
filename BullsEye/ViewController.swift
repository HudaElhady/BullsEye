//
//  ViewController.swift
//  BullsEye
//
//  Created by huda elhady on 7/29/17.
//  Copyright © 2017 Hudaelhady. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
      
      //MARK: - Variables
      var currentValue : Int = 50
      var targetValue : Int = 0
      
      //MARK: - Outlets
      @IBOutlet weak var slider : UISlider!
      
      //MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
      targetValue = 1 + Int(arc4random_uniform(100))
      }
    @IBAction func buttonClicked(_ sender: UIButton) {
        print("You finished!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
      
      //MARK: - Rounds Methods 
      
      func startNewRound()  {
            currentValue = 50
            targetValue = 1 + Int(arc4random_uniform(100))
            slider.value = Float(currentValue)
      }
      
      //MARK: - Actions

@IBAction func showAlert()
{
      let message = "Slider value is : \(currentValue)" + "\n the target value is :\(targetValue)"
    let alert = UIAlertController(title: "Hello world", message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    
}
    @IBAction func sliderMoved (_ slider : UISlider)
    {
       // print("slider value now is \(slider.value)")
    currentValue = lroundf(slider.value)
      //print("slider value now is \(currentValue)")
    }
}

