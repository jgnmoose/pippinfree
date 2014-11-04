//
//  Tutorial.swift
//  PippinFree
//
//  Created by Jeremy Novak on 10/17/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import SpriteKit

class Tutorial: SKNode {
    
    private let viewSize = UIScreen.mainScreen().bounds.size
    private var onboard = SKSpriteNode()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
        
        self.setupTutorial()
    }
    
    private func setupTutorial() {
        // Ready
        let ready = SKSpriteNode(texture: GameTexturesSharedInstance.textureAtlas.textureNamed("Ready"))
        ready.position = CGPoint(x: viewSize.width / 2, y: viewSize.height * 0.85)
        ready.zPosition = GameLayer.Interface
        ready.setScale(0.0)
        self.addChild(ready)
        
        // Ready Action
        let scaleIn = SKAction.scaleTo(1.0, duration: 0.5)
        let fadeIn = SKAction.fadeAlphaTo(1.0, duration: 0.5)
        let fadeInGroup = SKAction.group([scaleIn, fadeIn])
        
        let delay = SKAction.waitForDuration(0.5)
        
        let scaleOut = SKAction.scaleTo(0.0, duration: 0.5)
        let fadeOut = SKAction.fadeAlphaTo(0.0, duration: 0.5)
        let remove = SKAction.removeFromParent()
        let fadeOutGroup = SKAction.group([scaleOut, fadeOut, remove])
        
        ready.runAction(fadeInGroup)
        
        onboard = SKSpriteNode(texture: GameTexturesSharedInstance.textureAtlas.textureNamed("Tutorial"))
        onboard.position = CGPoint(x: viewSize.width / 2, y: viewSize.height / 2)
        onboard.zPosition = GameLayer.Interface
        onboard.name = "Onboard"
        self.addChild(onboard)
    }
    
    func blinkTutorial() {
        let blink = SKAction.sequence([SKAction.fadeOutWithDuration(0.25), SKAction.fadeInWithDuration(0.25)])
        let blinkSequence = SKAction.repeatAction(blink, count: 3)
        
        onboard.runAction(blinkSequence, completion: {
            // Odd behavior in Swift implementation of the completion block. Must contain a runAction call
            self.runAction(SKAction.waitForDuration(0.0))
            self.scene?.userInteractionEnabled = true
        })
    }
    
    func hideTutorial() {
        self.hidden = true
    }

}