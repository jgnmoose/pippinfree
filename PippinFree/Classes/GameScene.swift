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
    private let player = Player()
    
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
                player.fly()
        
            case GameState.GameOver:
                return
            
            default:
                return
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        switch state {
            case GameState.Tutorial:
                return
            
            case GameState.Play:
                return
            
            case GameState.GameOver:
                return
            
            default:
                return
        }
    }
    
    func didBeginContact(contact: SKPhysicsContact!) {
        if state == GameState.Tutorial || state == GameState.GameOver {
            return
        } else {
            var other:SKPhysicsBody = contact.bodyA.categoryBitMask == Contact.Player ? contact.bodyB : contact.bodyA
            
            if other.categoryBitMask == Contact.Scene {
                self.runAction(GameSoundsSharedInstance.bounce)
                self.runAction(GameSoundsSharedInstance.falling)
                self.switchToGameOver()
                
            } else if other.categoryBitMask == Contact.Spike {
                self.runAction(GameSoundsSharedInstance.whack)
                self.runAction(GameSoundsSharedInstance.falling)
                self.switchToGameOver()
                
            } else if other.categoryBitMask == Contact.Score {
                
            }
        }
    }
    
    // MARK: Setup
    func setupWorld() {
        // Gravity set in switchToPlay()
        self.physicsWorld.gravity = CGVectorMake(0, 0)
        self.physicsWorld.contactDelegate = self
        
        // Background color
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
        
        // Player
        self.addChild(player)
        
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
        
        self.physicsWorld.gravity = CGVectorMake(0, -5.0)
        
        ground.scrollGround()
        hills.scrollHills()
    }
    
    func switchToGameOver() {
        state = GameState.GameOver
        
        ground.stopGround()
        hills.stopHills()
    }
    
//    func flashBackground() {
//        let shake = SKAction.screenShakeWithNode(worldNode, amount: CGPoint(x: 20, y: 15), oscillations: 10, duration: 0.75)
//        let colorBackground = SKAction.runBlock({
//            self.backgroundColor = SKColor.redColor()
//            self.runAction(SKAction.waitForDuration(0.5), completion: {
//                self.backgroundColor = SKColor.whiteColor()
//            })
//        })
//        let flashGroup = SKAction.group([shake, colorBackground])
//        self.runAction(flashGroup)
//    }

}
