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
    internal var musicOff:SKTexture?
    internal var musicOn:SKTexture?
    internal var logBottomPath:CGMutablePathRef!
    internal var logTopPath:CGMutablePathRef!
    
    init () {
        textureAtlas = SKTextureAtlas(named: "Artwork")
        
        for index in 0...32 {
            smokering.append(self.textureAtlas.textureNamed(NSString(format: "Smokering%d", index)))
        }
        
        self.musicOff = self.textureAtlas.textureNamed("MusicOff")
        self.musicOn = self.textureAtlas.textureNamed("MusicOn")
        
        self.setupCGPathRefs()
    }
    
    func setupCGPathRefs() {
        let logBottom = self.textureAtlas.textureNamed("LogBottom")
        let logTop = self.textureAtlas.textureNamed("LogTop")
        
        let logBottomOffsetX = logBottom.size().width * 0.5
        let logBottomOffsetY = logBottom.size().height * 0.5
        
        let logTopOffsetX = logTop.size().width * 0.5
        let logTopOffsetY = logTop.size().height * 0.5
        
        if IS_IPAD {
            // Bottom Log
            self.logBottomPath = CGPathCreateMutable();
            CGPathMoveToPoint(self.logBottomPath, nil, 95 - logBottomOffsetX, 531 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logBottomPath, nil, 117 - logBottomOffsetX, 530 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logBottomPath, nil, 142 - logBottomOffsetX, 490 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logBottomPath, nil, 145 - logBottomOffsetX, 418 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logBottomPath, nil, 146 - logBottomOffsetX, 74 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logBottomPath, nil, 133 - logBottomOffsetX, 31 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logBottomPath, nil, 111 - logBottomOffsetX, 2 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logBottomPath, nil, 98 - logBottomOffsetX, 4 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logBottomPath, nil, 83 - logBottomOffsetX, 20 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logBottomPath, nil, 65 - logBottomOffsetX, 24 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logBottomPath, nil, 53 - logBottomOffsetX, 53 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logBottomPath, nil, 50 - logBottomOffsetX, 428 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logBottomPath, nil, 52 - logBottomOffsetX, 456 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logBottomPath, nil, 60 - logBottomOffsetX, 486 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logBottomPath, nil, 72 - logBottomOffsetX, 493 - logBottomOffsetY);
            CGPathCloseSubpath(self.logBottomPath);
            
            // Top Log
            self.logTopPath = CGPathCreateMutable();
            CGPathMoveToPoint(self.logTopPath, nil, 101 - logBottomOffsetX, 533 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logTopPath, nil, 115 - logBottomOffsetX, 531 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logTopPath, nil, 146 - logBottomOffsetX, 469 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logTopPath, nil, 145 - logBottomOffsetX, 148 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logTopPath, nil, 142 - logBottomOffsetX, 48 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logTopPath, nil, 118 - logBottomOffsetX, 7 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logTopPath, nil, 93 - logBottomOffsetX, 7 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logTopPath, nil, 74 - logBottomOffsetX, 31 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logTopPath, nil, 67 - logBottomOffsetX, 46 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logTopPath, nil, 57 - logBottomOffsetX, 54 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logTopPath, nil, 50 - logBottomOffsetX, 109 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logTopPath, nil, 52 - logBottomOffsetX, 471 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logTopPath, nil, 63 - logBottomOffsetX, 510 - logBottomOffsetY);
            CGPathAddLineToPoint(self.logTopPath, nil, 86 - logBottomOffsetX, 517 - logBottomOffsetY);
            CGPathCloseSubpath(self.logTopPath);
        } else {
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
}
