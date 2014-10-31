//
//  GameKitHelper.swift
//  PippinFree
//
//  Created by Jeremy Novak on 10/20/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import GameKit

let GameKitHelperSharedInstance = GameKitHelper()

class GameKitHelper:NSObject {
    class var sharedInstance:GameKitHelper {
        return GameKitHelperSharedInstance
    }
    
    private var enableGameCenter:Bool!
    var authenticationViewController = UIViewController()
    
    override init() {
        super.init()
        
        enableGameCenter = false
    }
    
    func authenticatePlayer() {
        let localPlayer = GKLocalPlayer.localPlayer()
        
        localPlayer.authenticateHandler = {(viewController: UIViewController!, error: NSError!) -> Void in

            if viewController != nil {
                self.setAuthenticationViewController(viewController)
            } else if localPlayer.authenticated {
                self.enableGameCenter = true
            }
        }
    }
    
    func setAuthenticationViewController(authenticationViewController: UIViewController) {
        self.authenticationViewController = authenticationViewController
        NSNotificationCenter.defaultCenter().postNotificationName("GameCenterViewController", object: self)
    }
}