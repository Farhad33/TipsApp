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
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var blackLine: UIView!
    @IBOutlet weak var Total: UILabel!
    @IBOutlet weak var tipPercentage: UILabel!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var personNumber: UILabel!
    @IBOutlet weak var stepperSplit: UIStepper!
    @IBOutlet weak var eachPersonAmount: UILabel!
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    
//    @IBAction func moveDown(){
//        tipLabel.center.y += 500
//        tipAmountLabel.center.y += 500
//        blackLine.center.y += 500
//        totalLabel.center.y += 500
//        tipPercentageLabel.center.y += 500
//        slider.center.y += 500
//        Total.center.y += 500
//        tipPercentage.center.y += 500
//    }
    
    func time(){
        let savedTime = NSUserDefaults.standardUserDefaults().objectForKey("savedTime") as? NSDate
        
        if (savedTime != nil && NSDate().timeIntervalSinceDate(savedTime!) < 600){
            billField.text = NSUserDefaults.standardUserDefaults().stringForKey("savedAmount")
        }
        else {
            userDefaults.setDouble(0, forKey: "savedAmount")
            billField.text = userDefaults.stringForKey("savedAmount")
            userDefaults.setObject(NSDate(), forKey: "savedTime")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        billField.becomeFirstResponder()
        billField.text = userDefaults.stringForKey("savedAmount")
    }
    

    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        slider.value = userDefaults.floatForKey("minimum")
        onEditingChanged(nil)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    
    @IBAction func onEditingChanged(sender: AnyObject?) {

        let currencyFormatter = NSNumberFormatter()
        currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        currencyFormatter.locale = NSLocale.currentLocale()
        
        slider.minimumValue = userDefaults.floatForKey("minimum")
        slider.maximumValue = userDefaults.floatForKey("maximum")
        
        let billAmount = NSString(string: billField.text!).doubleValue
        userDefaults.setDouble(billAmount, forKey: "savedAmount")
       
        let temp = Int(slider.value)
        print(temp)
        tipPercentageLabel.text = "\(temp)%"
        let tipPercentage = Double(temp) / 100
        
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = currencyFormatter.stringFromNumber(tip)
        totalLabel.text = currencyFormatter.stringFromNumber(total)
        
        personNumber.text = String(Int(stepperSplit.value))
        let eachPerson = total / stepperSplit.value
        eachPersonAmount.text = currencyFormatter.stringFromNumber(eachPerson)
        
        time()
    }
    

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    

    
}






