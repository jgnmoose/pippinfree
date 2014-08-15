//
//  Constants.swift
//  PippinFree
//
//  Created by Jeremy Novak on 8/14/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import Foundation
import SpriteKit

let kDebug = true
let kShowAds = false


func SKColorFromRBG (rbgValue: Int) -> SKColor {
    return SKColor(red: CGFloat((rbgValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rbgValue & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rbgValue & 0x0000FF) / 255.0, alpha: 1.0)
}

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
let kNameForeground = "Foreground"