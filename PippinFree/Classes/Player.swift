//
//  Player.swift
//  PippinFree
//
//  Created by Jeremy Novak on 8/15/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode {
    
    private let viewSize = UIScreen.mainScreen().bounds.size
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private override init(texture: SKTexture!, color: UIColor!, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience override init() {
        let playerTexture = GameTexturesSharedInstance.textureAtlas.textureNamed("Pippin0")
        self.init(texture: playerTexture, color: SKColor.whiteColor(), size: playerTexture.size())
        
        self.setupPlayer()
    }
    
    private func setupPlayer () {
        self.position = CGPoint(x: viewSize.width * 0.25, y: viewSize.height * 0.75)
        self.zPosition = GameLayer.Game
        self.name = kNamePlayer
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.height / 2 )
        self.physicsBody?.categoryBitMask = Contact.Player
        self.physicsBody?.collisionBitMask = Contact.Scene
        self.physicsBody?.contactTestBitMask = Contact.Scene | Contact.Logs
    }
    
    func animate() {
        let animationFrames = [GameTexturesSharedInstance.textureAtlas.textureNamed("Pippin0"), GameTexturesSharedInstance.textureAtlas.textureNamed("Pippin1")]
        self.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(animationFrames, timePerFrame: 0.15)))
    }

    func blink() {
        let blink = SKAction.sequence([SKAction.fadeOutWithDuration(0.15), SKAction.fadeInWithDuration(0.15)])
        let blinkSequence = SKAction.repeatAction(blink, count: 3)
        self.runAction(blinkSequence, completion: {
            self.hidden = true
        })
    }
    
    func stopAnimation() {
        self.removeAllActions()
    }
    
    func update() {
        if self.physicsBody?.velocity.dy > 30.0 {
            self.zRotation = CGFloat(M_PI / 6.0)
        } else if self.physicsBody?.velocity.dy < -100.0 {
            self.zRotation = CGFloat(-1 * M_PI_4)
        } else {
            self.zRotation = 0.0
        }
    }
    
    func fly() {
        
        var impulse = CGVectorMake(0, 15)
        
        if IS_IPAD {
            impulse = CGVectorMake(0, impulse.dy * 6)
        }
        
        self.physicsBody?.velocity = CGVectorMake(0, 0)
        self.physicsBody?.applyImpulse(impulse)
        self.runAction(GameSoundsSharedInstance.flying)
    }
}
