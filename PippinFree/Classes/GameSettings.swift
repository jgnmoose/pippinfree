//
//  GameSettings.swift
//  PippinFree
//
//  Created by Jeremy Novak on 8/16/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import Foundation

let GameSettingsSharedInstance = GameSettings()

class GameSettings {
    
    class var sharedInstane:GameSettings {
        return GameSettingsSharedInstance
    }
    
    internal var localDefaults = NSUserDefaults.standardUserDefaults()
    internal var bestScore:Int!
    internal var musicEnabled:Bool!
    
    private var keyFirstRun = "FirstRun"
    private var keyBestScore = "BestScore"
    private var keyMusicEnabled = "MusicEnabled"
    internal let keyNeverRate = "NeverRate"
    private let keyNumLaunches = "NumLaunches"
    
    private let promptSessions = 4
    private var launchedSessions = 0
    
    #if FREE
    private let appName = "Fly Pippin - Free"
    #else
    private let appName = "Fly Pippin"
    #endif
    
    
    init () {
        // Guard against defaults not being written yet during first launch
        if localDefaults.objectForKey(keyFirstRun) == nil {
            musicEnabled = true
            bestScore = 0
        } else {
            musicEnabled = localDefaults.boolForKey(keyMusicEnabled)
            bestScore = localDefaults.integerForKey(keyBestScore)
        }
    }
    
    func firstLaunch() {
        if (localDefaults.objectForKey(keyFirstRun) == nil) {
            localDefaults.setInteger(0, forKey: keyBestScore)
            localDefaults.setBool(true, forKey: keyMusicEnabled)
            localDefaults.setBool(false, forKey: keyFirstRun)
            localDefaults.setBool(false, forKey: keyNeverRate)
            localDefaults.synchronize()
        }
    }
    
    func saveScore(score: Int) {
        bestScore = score
        
        localDefaults.setInteger(bestScore, forKey: keyBestScore)
        localDefaults.synchronize()
    }
    
    func saveMusicEnabled(enabled: Bool) {
        musicEnabled = enabled
        
        localDefaults.setBool(musicEnabled, forKey: keyMusicEnabled)
        localDefaults.synchronize()
    }
    
    func shouldRateApp() -> Bool {
        if localDefaults.boolForKey(keyNeverRate) == false || localDefaults.objectForKey(keyNeverRate) == nil {
            launchedSessions = localDefaults.integerForKey(keyNumLaunches)
            launchedSessions++
            localDefaults.setInteger(launchedSessions, forKey: keyNumLaunches)
            localDefaults.setBool(false, forKey: keyNeverRate)
            localDefaults.synchronize()
            
            return launchedSessions % promptSessions == 0 ? true : false
            
        } else {
            return false
        }
    }
}
