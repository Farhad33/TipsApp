//
//  ViewController.swift
//  tips
//
//  Created by Majid Rahimi on 12/1/15.
//  Copyright © 2015 Majid Rahimi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        let currencyFormatter = NSNumberFormatter()
        currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        currencyFormatter.locale = NSLocale.currentLocale()
        
        slider.minimumValue = userDefaults.floatForKey("minimum")
        slider.maximumValue = userDefaults.floatForKey("maximum")
        
        let billAmount = NSString(string: billField.text!).doubleValue
       
        let temp = Int(slider.value)
        print(temp)
        tipPercentageLabel.text = "\(temp)%"
        let tipPercentage = Double(temp) / 100
        
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = currencyFormatter.stringFromNumber(tip)
        totalLabel.text = currencyFormatter.stringFromNumber(total)
  
    }
    

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    

    
}






