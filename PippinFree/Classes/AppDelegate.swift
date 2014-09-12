//
//  AppDelegate.swift
//  PippinFree
//
//  Created by Jeremy Novak on 8/14/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?

    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        GameSettingsSharedInstance.firstLaunch()

        return true
    }

    func applicationWillResignActive(application: UIApplication!) {
        if GameSoundsSharedInstance.musicPlayer.playing {
            GameSoundsSharedInstance.pauseBackgroundMusic()
        }
        
        let view = self.window?.rootViewController?.view as SKView
        view.paused = true
    }

    func applicationDidEnterBackground(application: UIApplication!) {
    }

    func applicationWillEnterForeground(application: UIApplication!) {
    }

    func applicationDidBecomeActive(application: UIApplication!) {
        if GameSoundsSharedInstance.musicPlayer.playing {
            GameSoundsSharedInstance.resumeBackgroundMusic()
        }
        
        let view = self.window?.rootViewController?.view as SKView
        view.paused = false
    }

    func applicationWillTerminate(application: UIApplication!) {
    }


}

