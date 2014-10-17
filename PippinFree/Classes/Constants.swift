//
//  Constants.swift
//  PippinFree
//
//  Created by Jeremy Novak on 8/14/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import SpriteKit

// MARK: Common Functions
func SKColorFromRBG (rbgValue: Int) -> SKColor {
    return SKColor(red: CGFloat((rbgValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rbgValue & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rbgValue & 0x0000FF) / 255.0, alpha: 1.0)
}

func RandomFloatRange(min: CGFloat, max: CGFloat) -> CGFloat {
    return CGFloat(arc4random() / 0xFFFFFFFF) * (max - min) + min
}

func RandomPositionY(height: CGFloat) -> CGFloat {
    return CGFloat(Int(arc4random_uniform(UInt32(UInt(height / 3)))))
}

// MARK: Layers
class GameLayer {
    class var Sky:CGFloat       { return 0 }
    class var Hills:CGFloat     { return 1 }
    class var Logs:CGFloat     { return 2 }
    class var Ground:CGFloat    { return 3 }
    class var Game:CGFloat      { return 4 }
    class var Effects:CGFloat   { return 5 }
    class var Interface:CGFloat { return 6 }
}

// MARK: Contact
class Contact {
    class var Scene:UInt32  { return 1 << 0 }
    class var Logs:UInt32  { return 1 << 1 }
    class var Player:UInt32 { return 1 << 2 }
    class var Score:UInt32  { return 1 << 3 }
}

// MARK: Game State
enum GameState:Int {
    case Tutorial
    case Play
    case GameOver
}

// MARK: Debug Flags
let kDebug = false
let kShowAds = false

// MARK: Colors
let kBGColor = 0x5CA1E7

// MARK: Sound Effects
let kSoundBounce = "bounce.caf"
let kSoundCoin = "coin.caf"
let kSoundFalling = "falling.caf"
let kSoundFlying = "flying.caf"
let kSoundHitGround = "hitGround.caf"
let kSoundOink = "oink.caf"
let kSoundPop = "pop.caf"
let kSoundWhack = "whack.caf"

// MARK: Music
let kMusicGame = "gamemusic.mp3"

// MARK: Object Names
let kNameGround = "Ground"
let kNameHills = "Hills"
let kNameLogs = "Logs"
let kNamePlayer = "Player"
let kNameSpawn = "SpawnLogs"

// MARK: Object Speeds
let kSpeedGround = 2.5
let kSpeedHills = 20.0
let kSpeedLogs = 5.5
