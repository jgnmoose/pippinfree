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
    
    func spawnLogs() {
        let logGap:CGFloat = 100.0
        
        let logBottom = SKSpriteNode(texture: GameTexturesSharedInstance.textureAtlas.textureNamed("LogBottom"))
        let logTop = SKSpriteNode(texture: GameTexturesSharedInstance.textureAtlas.textureNamed("LogTop"))
        
        self.position = CGPoint(x: viewSize.width + logBottom.size.width, y: 0)
        self.zPosition = GameLayer.Logs
        self.name = kNameLogs
    }
}