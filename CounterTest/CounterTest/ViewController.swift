//
//  ViewController.swift
//  CounterTest
//
//  Created by iosdev on 19.3.2018.
//  Copyright © 2018 niina riekki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var counterValue = 0
    var increment = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        display.text = String(counterValue)
    }

    @IBAction func slider(_ sender: UISlider) {
        print(Int(sender.value))
        increment = Int(sender.value);
    }
    
    @IBAction func reset(_ sender: UIButton) {
        counterValue = 0
        display.text = String(counterValue)
    }
    
    @IBAction func minus(_ sender: UIButton) {
        counterValue -= increment
        display.text = String(counterValue)
    }
    
    @IBAction func plus(_ sender: UIButton) {
        counterValue += increment
        display.text = String(counterValue)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

