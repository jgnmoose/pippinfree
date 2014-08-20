//
//  Clouds.swift
//  PippinFree
//
//  Created by Jeremy Novak on 8/16/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import SpriteKit

class Clouds: SKSpriteNode {
    
    private let viewSize = UIScreen.mainScreen().bounds.size
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(texture: SKTexture!, color: UIColor!, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience override init() {
        let cloudsTexture = SKTexture(imageNamed: "Clouds")
        self.init(texture: cloudsTexture, color: SKColor.whiteColor(), size: cloudsTexture.size())
        
        self.setupClouds()
        self.scrollClouds()
    }

    private func setupClouds() {
        self.anchorPoint = CGPointZero
        self.position = CGPointMake(RandomFloatRange(viewSize.width * 0.2, viewSize.height * 0.7), RandomFloatRange(viewSize.height * 0.4, viewSize.height * 0.7))
        self.zPosition = GameLayer.Sky
    }
    
    func scrollClouds() {
        // Create a random scroll speed based on scene width
        let scrollSpeed = NSTimeInterval(RandomFloatRange(viewSize.width / 6.0, viewSize.width / 10.0))
        
        let move = SKAction.moveTo(CGPointMake(0 - viewSize.width / 2, self.position.y), duration: scrollSpeed)
        let reset = SKAction.moveTo(CGPointMake(viewSize.width + self.size.width / 2, self.position.y), duration: 0)
        let sequence = SKAction.sequence([move, reset])
        
        self.runAction(SKAction.repeatActionForever(sequence))
    }
    
    func stopClouds() {
        self.removeAllActions()
    }
}
