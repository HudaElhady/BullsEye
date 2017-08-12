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
      var currentValue = 50
      var targetValue = 0
      var score = 0
      var round = 0
      
      
      //MARK: - Outlets
      @IBOutlet weak var slider : UISlider!
      @IBOutlet weak var targetLabel : UILabel!
      @IBOutlet weak var scoreLabel : UILabel!
      @IBOutlet weak var roundLabel : UILabel!
      
      
      //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
      let imageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
      let imageHeighlight = #imageLiteral(resourceName: "SliderThumb-Highlighted")
      slider.setThumbImage(imageNormal, for: .normal)
      slider.setThumbImage(imageHeighlight , for: .highlighted)
      
      let trackleLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
      let trackleRightImage = #imageLiteral(resourceName: "SliderTrackRight")
      let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
      let trackLeftResizable = trackleLeftImage.resizableImage(withCapInsets: insets)
      let trackRightResizable = trackleRightImage.resizableImage(withCapInsets: insets)
      slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
      slider.setMaximumTrackImage(trackRightResizable, for: .normal)
      
      

        startNewGame()
      updateLabels()
      }
    @IBAction func buttonClicked(_ sender: UIButton) {
        print("You finished!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
      
      
      func startNewRound()  {
            currentValue = 50
            targetValue = 1 + Int(arc4random_uniform(100))
            round += 1
          //  slider.value = Float(currentValue)
      }
      func updateLabels() {
      targetLabel.text = "\(targetValue)"
      scoreLabel.text = "\(score)"
      roundLabel.text = "\(round)"
      }
      
      func startNewGame()  {
            round = 0
            score = 0
            startNewRound()
      }
      
      //MARK: - Actions
@IBAction func startOver()
{
      startNewGame()

      updateLabels()
}
      
@IBAction func showAlert()
{
      let difference = abs(targetValue - currentValue)
      var points = 100 - difference
      
      let title : String
      if difference == 0 {
            title = "Perfect"
            points += 100
      }
      else if difference < 5
      {
            title = "You almost there"
            if difference == 1 {
                  points += 50
            }
      }else if difference < 10
      {
            title = "Pretty good"
      }else{
      title = "Not even good .."
      }
      score += points
      let message = "your score is \(points)"
    let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
      let action = UIAlertAction(title: "Ok", style: .default, handler: {
      action in
            self.startNewRound()
            self.updateLabels()
      })
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
//      startNewRound()
//      updateLabels()
    
}
    @IBAction func sliderMoved (_ slider : UISlider)
    {
       // print("slider value now is \(slider.value)")
    currentValue = lroundf(slider.value)
      //print("slider value now is \(currentValue)")
    }
}

