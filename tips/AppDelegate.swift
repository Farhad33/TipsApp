//
//  AppDelegate.swift
//  tips
//
//  Created by Majid Rahimi on 12/1/15.
//  Copyright © 2015 Majid Rahimi. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        UITextField.appearance().keyboardAppearance = .Dark
        
        userDefaults.floatForKey("minimum")
        userDefaults.floatForKey("maximum")
        userDefaults.doubleForKey("current")
        userDefaults.objectForKey("savedTime")
        userDefaults.doubleForKey("savedAmount")
        
        let firstEverLoad = userDefaults.boolForKey("first_Ever_Load")
        
        if(!firstEverLoad){
            userDefaults.setFloat(12, forKey: "minimum")
            userDefaults.setFloat(22, forKey: "maximum")
            userDefaults.setDouble(18, forKey: "current")
            userDefaults.setBool(true, forKey: "first_Ever_Load")
            userDefaults.setObject(NSData(), forKey: "savedTime")
            userDefaults.synchronize()
        }
        
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

