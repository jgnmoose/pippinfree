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
    private var keyBestScore = "BestSCcore"
    private var keyMusicEnabled = "MusicEnabled"
    
    
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
}
