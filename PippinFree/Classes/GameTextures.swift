//
//  GameTextures.swift
//  PippinFree
//
//  Created by Jeremy Novak on 8/15/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import SpriteKit

let GameTexturesSharedInstance = GameTextures()

class GameTextures {
    
    class var sharedInstance:GameTextures {
        return GameTexturesSharedInstance
    }
    
    internal var textureAtlas = SKTextureAtlas()
    internal var smokering = [SKTexture]()
    internal var logBottomPath:CGMutablePathRef!
    internal var logTopPath:CGMutablePathRef!
    
    init () {
        textureAtlas = SKTextureAtlas(named: "Artwork")
        
        for index in 0...35 {
            smokering.append(self.textureAtlas.textureNamed(NSString(format: "Smokering%d", index)))
        }
        
        self.setupCGPathRefs()
    }
    
    func setupCGPathRefs() {
        let logBottom = self.textureAtlas.textureNamed("LogBottom")
        let logTop = self.textureAtlas.textureNamed("LogTop")
        
        let logBottomOffsetX = logBottom.size().width * 0.5
        let logBottomOffsetY = logBottom.size().height * 0.5
        
        let logTopOffsetX = logTop.size().width * 0.5
        let logTopOffsetY = logTop.size().height * 0.5
        
        // Log Bottom Path
        logBottomPath = CGPathCreateMutable()
        CGPathMoveToPoint(logBottomPath, nil, 52 - logBottomOffsetX, 290 - logBottomOffsetY)
        CGPathAddLineToPoint(logBottomPath, nil, 62 - logBottomOffsetX, 290 - logBottomOffsetY)
        CGPathAddLineToPoint(logBottomPath, nil, 78 - logBottomOffsetX, 238 - logBottomOffsetY)
        CGPathAddLineToPoint(logBottomPath, nil, 80 - logBottomOffsetX, 47 - logBottomOffsetY)
        CGPathAddLineToPoint(logBottomPath, nil, 77 - logBottomOffsetX, 30 - logBottomOffsetY)
        CGPathAddLineToPoint(logBottomPath, nil, 67 - logBottomOffsetX, 8 - logBottomOffsetY)
        CGPathAddLineToPoint(logBottomPath, nil, 60 - logBottomOffsetX, 2 - logBottomOffsetY)
        CGPathAddLineToPoint(logBottomPath, nil, 45 - logBottomOffsetX, 12 - logBottomOffsetY)
        CGPathAddLineToPoint(logBottomPath, nil, 36 - logBottomOffsetX, 14 - logBottomOffsetY)
        CGPathAddLineToPoint(logBottomPath, nil, 29 - logBottomOffsetX, 29 - logBottomOffsetY)
        CGPathAddLineToPoint(logBottomPath, nil, 27 - logBottomOffsetX, 236 - logBottomOffsetY)
        CGPathAddLineToPoint(logBottomPath, nil, 31 - logBottomOffsetX, 264 - logBottomOffsetY)
        CGPathAddLineToPoint(logBottomPath, nil, 38 - logBottomOffsetX, 269 - logBottomOffsetY)
        CGPathCloseSubpath(logBottomPath)
        
        // Log Top Path
        logTopPath = CGPathCreateMutable()
        CGPathMoveToPoint(logTopPath, nil, 61 - logTopOffsetX, 291 - logTopOffsetY)
        CGPathAddLineToPoint(logTopPath, nil, 79 - logTopOffsetX, 260 - logTopOffsetY)
        CGPathAddLineToPoint(logTopPath, nil, 79 - logTopOffsetX, 81 - logTopOffsetY)
        CGPathAddLineToPoint(logTopPath, nil, 77 - logTopOffsetX, 27 - logTopOffsetY)
        CGPathAddLineToPoint(logTopPath, nil, 63 - logTopOffsetX, 2 - logTopOffsetY)
        CGPathAddLineToPoint(logTopPath, nil, 51 - logTopOffsetX, 3 - logTopOffsetY)
        CGPathAddLineToPoint(logTopPath, nil, 39 - logTopOffsetX, 20 - logTopOffsetY)
        CGPathAddLineToPoint(logTopPath, nil, 32 - logTopOffsetX, 29 - logTopOffsetY)
        CGPathAddLineToPoint(logTopPath, nil, 28 - logTopOffsetX, 50 - logTopOffsetY)
        CGPathAddLineToPoint(logTopPath, nil, 28 - logTopOffsetX, 254 - logTopOffsetY)
        CGPathAddLineToPoint(logTopPath, nil, 33 - logTopOffsetX, 278 - logTopOffsetY)
        CGPathAddLineToPoint(logTopPath, nil, 46 - logTopOffsetX, 282 - logTopOffsetY)
        CGPathCloseSubpath(logTopPath)
        
    }
    
}
