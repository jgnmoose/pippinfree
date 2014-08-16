//
//  GameScene.swift
//  PippinFree
//
//  Created by Jeremy Novak on 8/14/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private let textures = GameTexturesSharedInstance
    private let sounds = GameSoundsSharedInstance
    private let viewSize = UIScreen.mainScreen().bounds.size
    
    private var state = GameState.Tutorial
    private let hills = Hills()
    private let ground = Ground()
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    override func didMoveToView(view: SKView) {
        state = GameState.Tutorial
        
        self.setupWorld()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let touch:UITouch = touches.anyObject() as UITouch
        let touchLocation = touch.locationInNode(self)
        
        switch state {
            case GameState.Tutorial:
                self.switchToPlay()
            
            case GameState.Play:
                return
        
            case GameState.GameOver:
                return
            
            default:
                return
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
    }
    
    // MARK: Setup
    func setupWorld() {
        self.backgroundColor = SKColorFromRBG(kBGColor)
        
        // Sun
        let sun = SKSpriteNode(texture: textures.textureAtlas.textureNamed("Sun"))
        sun.position = CGPoint(x: viewSize.width * 0.15, y: viewSize.height * 0.8)
        sun.zPosition = GameLayer.Sky
        self.addChild(sun)
        
        // Clouds
        let clouds = Clouds()
        self.addChild(clouds)
        
        // Hills
        self.addChild(hills)
        
        // Ground
        self.addChild(ground)
        
        // Bounding box of playable area
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: CGRectMake(0, ground.size.height, viewSize.width, (viewSize.height - ground.size.height)))
        self.physicsBody.categoryBitMask = Contact.Scene
    }
    
    // MARK: State Methods
    func switchToTutorial() {
        state = GameState.Tutorial
    }
    
    func switchToPlay() {
        state = GameState.Play
        
        ground.scrollGround()
        hills.scrollHills()
    }
    
    func switchToGameOver() {
        state = GameState.GameOver
    }
}
