//
//  Foreground.swift
//  PippinFree
//
//  Created by Jeremy Novak on 8/15/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import SpriteKit

class Foreground: SKSpriteNode {
    
    private let viewSize = UIScreen.mainScreen().bounds
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture!, color: UIColor!, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience override init() {
        let foregroundTexture = SKTexture(imageNamed: "Foreground")
        self.init(texture: foregroundTexture, color: SKColor.whiteColor(), size: foregroundTexture.size())
        
        self.setupForeground()
    }

    func setupForeground () {
        self.anchorPoint = CGPointZero
        self.position = CGPointZero
        self.name = kNameForeground
        
        let foregroundCopy = Foreground(imageNamed: "Foreground")
        foregroundCopy.anchorPoint = CGPointZero
        foregroundCopy.position = CGPoint(x: viewSize.width, y: 0)
        self.addChild(foregroundCopy)
    }
    
}