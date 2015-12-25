//
//  SetingsViewController.swift
//  tips
//
//  Created by Majid Rahimi on 12/9/15.
//  Copyright © 2015 Majid Rahimi. All rights reserved.
//

import UIKit

class SetingsViewController: UIViewController {

    
    @IBOutlet weak var minText: UITextField!
    @IBOutlet weak var maxText: UITextField!
    @IBOutlet weak var minStepper: UIStepper!
    @IBOutlet weak var maxStepper: UIStepper!
    @IBOutlet weak var backButton: UIButton!

    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        minStepper.value = userDefaults.doubleForKey("minimum")
        minText.text = userDefaults.stringForKey("minimum")
        
        maxStepper.value = userDefaults.doubleForKey("maximum")
        maxText.text = userDefaults.stringForKey("maximum")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func onSetingsEditingChanged(sender: AnyObject) {
        if sender as! NSObject == maxStepper || sender as! NSObject == minStepper {
            minText.text = String(Int(minStepper.value))
            maxText.text = String(Int(maxStepper.value))
        }
        
        let min = Double(minText.text!)
        let max = Double(maxText.text!)
        
        userDefaults.setDouble(min!, forKey: "minimum")
        userDefaults.setDouble(max!, forKey: "maximum")
        userDefaults.synchronize()
        
    }

    
    @IBAction func BackDismiss(sender: UIButton) {
        view.endEditing(false)
        dismissViewControllerAnimated(true, completion: {})
    }


    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }


}
