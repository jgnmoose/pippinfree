//
//  GameOver.swift
//  PippinFree
//
//  Created by Jeremy Novak on 8/18/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import SpriteKit

class GameOver: SKNode {
    
    private let viewSize = UIScreen.mainScreen().bounds.size
    private let scoreFont = BMGlyphFont(name: "ScoreFont")
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
    }
    
    convenience init(score: Int) {
        self.init()
        self.setupGameOver(score)
    }

    func setupGameOver(score: Int) {
        // Game Over
        let gameOver = SKSpriteNode(texture: GameTexturesSharedInstance.textureAtlas.textureNamed("GameOver"))
        gameOver.position = CGPoint(x: viewSize.width / 2, y: viewSize.height * 0.8)
        gameOver.zPosition = GameLayer.Interface
        self.addChild(gameOver)

        // Update score if higher than best
        if score > GameSettingsSharedInstance.bestScore {
            GameSettingsSharedInstance.saveScore(score)
        }
        
        // Current Score
        let scoreTitle = SKSpriteNode(texture: GameTexturesSharedInstance.textureAtlas.textureNamed("Score"))
        scoreTitle.position = CGPoint(x: viewSize.width * 0.3, y: viewSize.height * 0.65)
        scoreTitle.zPosition = GameLayer.Interface
        self.addChild(scoreTitle)
        
        let scoreLabel = BMGlyphLabel(text: NSString(format: "%d", score), font: scoreFont)
        scoreLabel.position = CGPoint(x: viewSize.width * 0.3, y: viewSize.height * 0.5)
        scoreLabel.zPosition = GameLayer.Interface
        self.addChild(scoreLabel)
        
        // Best Score
        let bestScoreTitle = SKSpriteNode(texture: GameTexturesSharedInstance.textureAtlas.textureNamed("BestScore"))
        bestScoreTitle.position = CGPoint(x: viewSize.width * 0.7, y: viewSize.height * 0.65)
        bestScoreTitle.zPosition = GameLayer.Interface
        self.addChild(bestScoreTitle)
        
        let bestScoreLabel = BMGlyphLabel(text: NSString(format: "%d", GameSettingsSharedInstance.bestScore), font: scoreFont)
        bestScoreLabel.position = CGPoint(x: viewSize.width * 0.7, y: viewSize.height * 0.5)
        bestScoreLabel.zPosition = GameLayer.Interface
        self.addChild(bestScoreLabel)
    }
}
