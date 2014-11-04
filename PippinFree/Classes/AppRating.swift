//
//  AppRating.swift
//  PippinFree
//
//  Created by Jeremy Novak on 11/4/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import Foundation

class AppRating {
    
    internal var minSessions = 3
    internal var tryAgainSessions = 6
    
    private var keyNeverRate = "NeverRate"
    private var keyNumLaunches = "NumLaunches"
    
    private let defaults = GameSettingsSharedInstance.localDefaults
    
    func ratePippin() {
        var neverRate = defaults.boolForKey(keyNeverRate)
        var numLaunches = defaults.integerForKey("numLaunches") + 1
        
        if (!neverRate && (numLaunches == minSessions || numLaunches >= (minSessions + tryAgainSessions + 1))) {
            showRatePippin()
            numLaunches = minSessions + 1
        }
        
        defaults.setInteger(numLaunches, forKey: keyNumLaunches)
    }
    
    
    func showRatePippin() {
        
    }
    
    //    func showRateMe() {
    //        var alert = UIAlertController(title: "Rate Us", message: "Thanks for using <APP NAME>", preferredStyle: UIAlertControllerStyle.Alert)
    //        alert.addAction(UIAlertAction(title: "Rate <APP NAME>", style: UIAlertActionStyle.Default, handler: { alertAction in
    //            UIApplication.sharedApplication().openURL(NSURL(string : "itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=<iTUNES CONNECT APP ID>"))
    //            alert.dismissViewControllerAnimated(true, completion: nil)
    //        }))
    //        alert.addAction(UIAlertAction(title: "No Thanks", style: UIAlertActionStyle.Default, handler: { alertAction in
    //            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "neverRate")
    //            alert.dismissViewControllerAnimated(true, completion: nil)
    //        }))
    //        alert.addAction(UIAlertAction(title: "Maybe Later", style: UIAlertActionStyle.Default, handler: { alertAction in
    //            alert.dismissViewControllerAnimated(true, completion: nil)
    //        }))
    //        self.presentViewController(alert, animated: true, completion: nil)
    //    }
}