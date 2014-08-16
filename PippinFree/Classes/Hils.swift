//
//  Hils.swift
//  PippinFree
//
//  Created by Jeremy Novak on 8/16/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import SpriteKit

class Hills: SKSpriteNode {
    
    private let viewSize = UIScreen.mainScreen().bounds
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture!, color: UIColor!, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    
    convenience override init() {
        let foregroundTexture = SKTexture(imageNamed: "Hills")
        self.init(texture: foregroundTexture, color: SKColor.whiteColor(), size: foregroundTexture.size())
        
        self.setupHills()
    }
    
    func setupHills () {
        let foreground = SKTexture(imageNamed: "Foreground")
        self.anchorPoint = CGPointZero
        self.position = CGPoint(x: 0, y: foreground.size().height - foreground.size().height * 0.1)
        self.name = kNameHills
        
        let hillsCopy = Hills(texture: self.texture)
        hillsCopy.anchorPoint = CGPointZero
        hillsCopy.position = CGPoint(x: viewSize.width, y: self.position.y)
        self.addChild(hillsCopy)
    }
}
