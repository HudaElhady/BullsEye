//
//  ViewController.swift
//  BullsEye
//
//  Created by huda elhady on 7/29/17.
//  Copyright © 2017 Hudaelhady. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func buttonClicked(_ sender: UIButton) {
        print("You finished!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

@IBAction func showAlert()
{
    let alert = UIAlertController(title: "Hello world", message: "this is my first app", preferredStyle: .alert)
    let action = UIAlertAction(title: "ok", style: .default, handler: nil)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    
}
}

