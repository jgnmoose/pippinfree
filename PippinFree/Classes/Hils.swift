//
//  Hils.swift
//  PippinFree
//
//  Created by Jeremy Novak on 8/16/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import SpriteKit

class Hills: SKSpriteNode {
    
    private let viewSize = UIScreen.mainScreen().bounds.size
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture!, color: UIColor!, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience override init() {
        let hillsTexture = SKTexture(imageNamed: "Hills")
        self.init(texture: hillsTexture, color: SKColor.whiteColor(), size: hillsTexture.size())
        
        self.setupHills()
    }
    
    private func setupHills () {
        let ground = SKTexture(imageNamed: "Ground")
        self.anchorPoint = CGPointZero
        self.position = CGPoint(x: 0, y: ground.size().height - ground.size().height * 0.1)
        self.zPosition = GameLayer.Hills
        self.name = kNameHills
        
        let hillsCopy = Hills(texture: self.texture)
        hillsCopy.anchorPoint = CGPointZero
        hillsCopy.position = CGPoint(x: viewSize.width, y: 0)
        self.addChild(hillsCopy)
    }
    
    func scrollHills () {
        let move = SKAction.moveTo(CGPointMake(-viewSize.width, self.position.y), duration: kSpeedHills)
        let reset = SKAction.moveTo(CGPointMake(0, self.position.y), duration: 0)
        let sequence = SKAction.sequence([move, reset])
        self.runAction(SKAction.repeatActionForever(sequence))
    }
    
    func stopHills () {
        self.removeAllActions()
    }
}
