//
//  Smoke.swift
//  PippinFree
//
//  Created by Jeremy Novak on 8/18/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import SpriteKit

class Smoke: SKSpriteNode {
    
    private let viewSize = UIScreen.mainScreen().bounds.size

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture!, color: UIColor!, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience override init() {
        let smokeTexture = SKTexture(imageNamed: "Smokering0")
        self.init(texture: smokeTexture, color: SKColor.whiteColor(), size: smokeTexture.size())
        
        self.hidden = true
    }
    
    func animateSmoke(position: CGPoint) {
        self.hidden = false
        self.position = CGPoint(x: position.x, y: position.y)
        self.zPosition = GameLayer.Effects
        
        self.runAction(SKAction.animateWithTextures(GameTexturesSharedInstance.smokering, timePerFrame: 0.05), completion: {
            self.hidden = true
        })
    }
}
