//
//  Ground.swift
//  PippinFree
//
//  Created by Jeremy Novak on 8/15/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import SpriteKit

class Ground: SKSpriteNode {
    
    private let viewSize = UIScreen.mainScreen().bounds.size
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture!, color: UIColor!, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience override init() {
        let groundTexture = SKTexture(imageNamed: "Ground")
        self.init(texture: groundTexture, color: SKColor.whiteColor(), size: groundTexture.size())
        
        self.setupGround()
    }

    private func setupGround () {
        self.anchorPoint = CGPointZero
        self.position = CGPointZero
        self.zPosition = GameLayer.Ground
        self.name = kNameGround
        
        let groundCopy = Ground(texture: self.texture)
        groundCopy.anchorPoint = CGPointZero
        groundCopy.position = CGPoint(x: viewSize.width, y: 0)
        self.addChild(groundCopy)
    }
    
    func scrollGround () {
        let move = SKAction.moveTo(CGPoint(x: -viewSize.width, y: self.position.y), duration: kSpeedGround)
        let reset = SKAction.moveTo(CGPoint(x: 0, y: self.position.y), duration: 0)
        let sequence = SKAction.sequence([move, reset])
        self.runAction(SKAction.repeatActionForever(sequence))
    }
    
    func stopGround () {
        self.removeAllActions()
    }
    
}