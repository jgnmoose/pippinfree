//
//  Spike.swift
//  PippinFree
//
//  Created by Jeremy Novak on 8/15/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import SpriteKit

class Logs: SKNode {
    
    private let viewSize = UIScreen.mainScreen().bounds.size
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    override init () {
        super.init()
        
        self.spawnLogs()
    }
    
    func spawnLogs() {
        var logGap:CGFloat = 100.0
        
        if IS_IPAD {
            logGap = 155.0
        }
        
        // Create and position Bottom and Top Logs
        let logBottom = SKSpriteNode(texture: GameTexturesSharedInstance.textureAtlas.textureNamed("LogBottom"))
        let logTop = SKSpriteNode(texture: GameTexturesSharedInstance.textureAtlas.textureNamed("LogTop"))
        
        self.position = CGPoint(x: viewSize.width + logBottom.size.width, y: 0)
        self.zPosition = GameLayer.Logs
        self.name = kNameLogs
        
        let randomY = RandomPositionY(viewSize.height / 3)
        logBottom.position = CGPoint(x: 0, y: randomY)
        logTop.position = CGPoint(x: logBottom.position.x, y: randomY + logBottom.size.height + logGap)
        
        // Log Physics Bodies
        logBottom.physicsBody = SKPhysicsBody(polygonFromPath: GameTexturesSharedInstance.logBottomPath)
        logBottom.physicsBody?.dynamic = false
        logBottom.physicsBody?.categoryBitMask = Contact.Logs
        logBottom.physicsBody?.collisionBitMask = Contact.Player
        logBottom.physicsBody?.contactTestBitMask = Contact.Player
        
        logTop.physicsBody = SKPhysicsBody(polygonFromPath: GameTexturesSharedInstance.logTopPath)
        logTop.physicsBody?.dynamic = false
        logTop.physicsBody?.categoryBitMask = Contact.Logs
        logTop.physicsBody?.collisionBitMask = Contact.Player
        logTop.physicsBody?.contactTestBitMask = Contact.Player
        
        // Create and position Score Node
        let scoreNode = SKNode()
        scoreNode.position = CGPoint(x: logBottom.size.width, y: viewSize.height / 2)
        scoreNode.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(logBottom.size.width / 2, viewSize.height))
        scoreNode.physicsBody?.dynamic = false
        scoreNode.physicsBody?.categoryBitMask = Contact.Score
        scoreNode.physicsBody?.collisionBitMask = 0x0
        scoreNode.physicsBody?.contactTestBitMask = Contact.Player
        
        // Add children
        self.addChild(logBottom)
        self.addChild(logTop)
        self.addChild(scoreNode)
        
        // Movement Action
        let move = SKAction.moveToX(-viewSize.width, duration: kSpeedLogs)
        let remove = SKAction.removeFromParent()
        let sequence = SKAction.sequence([move, remove])
        self.runAction(sequence, withKey: "SpawnLogs")
    }
}