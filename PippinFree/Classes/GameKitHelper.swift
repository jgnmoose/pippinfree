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
    
    override init() {
        super.init()
        
        enableGameCenter = true
    }
    
    func authenticatePlayer() {
        let localPlayer = GKLocalPlayer.localPlayer()
        
        localPlayer.authenticateHandler = {(viewController : UIViewController!, error : NSError!) -> Void in
            self.setLastError(error)
            
            if viewController != nil {
                self.setAuthenticationViewController(viewController)
            } else if localPlayer.authenticated {
                self.enableGameCenter = true
            } else {
                self.enableGameCenter = false
            }
        
        }
    }
    
    func setAuthenticationViewController(authenticationViewController: UIViewController) {
//        if (authenticationViewController != nil) {
//            self.authenticationViewController = authenticationViewController;
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"GameCenterViewController" object:self];
//        }
    }
    
    func setLastError(error: NSError) {
        var lastError:NSError = error.copy() as NSError
        
        if lastError.description != nil {
            println(lastError.description)
        }
//        _lastError = [error copy];
//        if (self.lastError) {
//            NSLog(@"GameKitHelper ERROR: %@", [[self.lastError userInfo] description]);
//        }
    }
}