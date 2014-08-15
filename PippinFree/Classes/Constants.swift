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