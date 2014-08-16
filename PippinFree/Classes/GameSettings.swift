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
}
