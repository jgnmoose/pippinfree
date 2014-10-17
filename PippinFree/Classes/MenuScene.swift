//
//  MenuScene.swift
//  PippinFree
//
//  Created by Jeremy Novak on 8/14/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    
    private let viewSize = UIScreen.mainScreen().bounds.size
    
    private var playButton = SKSpriteNode()
    private var bounceTimer:NSTimer!
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    override func didMoveToView(view: SKView) {
        GameSoundsSharedInstance.playBackgroundMusic(kMusicGame)
        
        self.setupMenu()
        
        bounceTimer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: Selector("animatePlay"), userInfo: nil, repeats: true)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let touch:UITouch = touches.anyObject() as UITouch
        let touchLocation = touch.locationInNode(self)
        
        if playButton.containsPoint(touchLocation) {
            self.switchToPlay()
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
    }
    
    func setupMenu() {
        // Background Color
        self.backgroundColor = SKColorFromRBG(kBGColor)
        
        // Sun
        let sun = SKSpriteNode(texture: GameTexturesSharedInstance.textureAtlas.textureNamed("Sun"))
        sun.position = CGPoint(x: viewSize.width * 0.15, y: viewSize.height * 0.8)
        sun.zPosition = GameLayer.Sky
        self.addChild(sun)
        
        // Clouds
        let clouds = Clouds()
        self.addChild(clouds)
        
        // Ground
        let ground = Ground()
        self.addChild(ground)
        
        // Hills
        let hills = Hills()
        self.addChild(hills)
        
        // Game Logo
        let logo = SKSpriteNode(imageNamed: "Logo")
        logo.position = CGPoint(x: viewSize.width / 2, y: viewSize.height * 0.6)
        logo.zPosition = GameLayer.Interface
        self.addChild(logo)
        
        // Play Button
        playButton = SKSpriteNode(texture: GameTexturesSharedInstance.textureAtlas.textureNamed("Play"))
        playButton.position = CGPoint(x: viewSize.width / 2, y: viewSize.height * 0.25)
        playButton.zPosition = GameLayer.Interface
        self.addChild(playButton)
    }
    
    func animatePlay() {
        let bounceLarger = SKAction.scaleTo(1.25, duration: 0.15)
        let bounceNormal = SKAction.scaleTo(1.0, duration: 0.15)
        let bounceSequence = SKAction.sequence([bounceLarger, GameSoundsSharedInstance.pop, bounceNormal])
        playButton.runAction(SKAction.repeatAction(bounceSequence, count: 3))
    }
    
    func switchToPlay() {
        self.runAction(GameSoundsSharedInstance.pop)
        
        bounceTimer.invalidate()
        
        let gameScene = GameScene(size: viewSize)
        gameScene.scaleMode = SKSceneScaleMode.AspectFill
        let transition = SKTransition.fadeWithColor(SKColor.blackColor(), duration: 0.1)
        self.view?.presentScene(gameScene)
    }
}