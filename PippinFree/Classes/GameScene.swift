//
//  GameScene.swift
//  PippinFree
//
//  Created by Jeremy Novak on 8/14/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private let viewSize = UIScreen.mainScreen().bounds.size
    
    private var state = GameState.Tutorial
    private let worldNode = SKNode()
    private let hills = Hills()
    private let ground = Ground()
    private let player = Player()
    private let scoreFont = BMGlyphFont(name: "ScoreFont")
    private var score:Int = 0
    private var retry = SKSpriteNode()
    private var leaders = SKSpriteNode()
    private var scoreHud = BMGlyphLabel()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    override func didMoveToView(view: SKView) {
        state = GameState.Tutorial
        
        self.scene.userInteractionEnabled = false
        self.setupWorld()
        self.switchToTutorial()
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
                if retry.containsPoint(touchLocation) {
                    self.switchToNewGame()
                }
            
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
                
            } else if other.categoryBitMask == Contact.Logs {
                self.runAction(GameSoundsSharedInstance.whack)
                self.runAction(GameSoundsSharedInstance.falling)
                self.switchToGameOver()
                
            } else if other.categoryBitMask == Contact.Score {
                self.updateScore()
            }
        }
    }
    
    // MARK: Setup
    func setupWorld() {
        // Gravity set in switchToPlay()
        self.physicsWorld.gravity = CGVectorMake(0, 0)
        self.physicsWorld.contactDelegate = self
        
        // Add the gameNode to the scene
        self.addChild(worldNode)
        
        // Background color
        self.backgroundColor = SKColorFromRBG(kBGColor)
        
        // Sun
        let sun = SKSpriteNode(texture: GameTexturesSharedInstance.textureAtlas.textureNamed("Sun"))
        sun.position = CGPoint(x: viewSize.width * 0.15, y: viewSize.height * 0.8)
        sun.zPosition = GameLayer.Sky
        worldNode.addChild(sun)
        
        // Clouds
        let clouds = Clouds()
        worldNode.addChild(clouds)
        
        // Hills
        worldNode.addChild(hills)
        
        // Ground
        worldNode.addChild(ground)
        
        // Player
        worldNode.addChild(player)
        
        // Bounding box of playable area
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: CGRectMake(0, ground.size.height, viewSize.width, (viewSize.height - ground.size.height)))
        self.physicsBody.categoryBitMask = Contact.Scene
        
        // Score
        score = 0
        scoreHud = BMGlyphLabel(text: NSString(format: "%d", score), font: scoreFont)
        scoreHud.position = CGPoint(x: viewSize.width / 2, y: viewSize.height * 0.85)
        scoreHud.zPosition = GameLayer.Interface
        scoreHud.hidden = true
        worldNode.addChild(scoreHud)
    }
    
    // MARK: State Methods
    func switchToTutorial() {
        state = GameState.Tutorial
        
        // Ready
        let ready = SKSpriteNode(texture: GameTexturesSharedInstance.textureAtlas.textureNamed("Ready"))
        ready.position = CGPoint(x: viewSize.width / 2, y: viewSize.height * 0.75)
        ready.zPosition = GameLayer.Interface
        ready.setScale(0.0)
        worldNode.addChild(ready)
        
        // Ready Action
        let scaleIn = SKAction.scaleTo(1.0, duration: 0.5)
        let fadeIn = SKAction.fadeAlphaTo(1.0, duration: 0.5)
        let fadeInGroup = SKAction.group([scaleIn, fadeIn])
        
        let delay = SKAction.waitForDuration(0.5)
        
        let scaleOut = SKAction.scaleTo(0.0, duration: 0.5)
        let fadeOut = SKAction.fadeAlphaTo(0.0, duration: 0.5)
        let remove = SKAction.removeFromParent()
        let fadeOutGroup = SKAction.group([scaleOut, fadeOut, remove])
        
        ready.runAction(SKAction.sequence([fadeInGroup, delay, fadeOutGroup]))
        
        // Tutorial
        let tutorial = SKSpriteNode(texture: GameTexturesSharedInstance.textureAtlas.textureNamed("Tutorial"))
        tutorial.position = CGPoint(x: viewSize.width / 2, y: viewSize.height / 2)
        tutorial.zPosition = GameLayer.Interface
        tutorial.name = "Tutorial"
        worldNode.addChild(tutorial)
        
        // Tutorial Action
        let blink = SKAction.sequence([SKAction.fadeOutWithDuration(0.25), SKAction.fadeInWithDuration(0.25)])
        let blinkSequence = SKAction.repeatAction(blink, count: 3)
        tutorial.runAction(blinkSequence, completion: {
            tutorial.removeFromParent()
            self.scene.userInteractionEnabled = true
        })
    }
    
    func switchToPlay() {
        state = GameState.Play
        
        // Set gravity
        self.physicsWorld.gravity = CGVectorMake(0, -5.0)
        
        // Scroll world and animate player
        ground.scrollGround()
        hills.scrollHills()
        player.animate()
        
        // Unhide Score HUD
        scoreHud.hidden = false
        
        // Spawn Logs
        let delay = SKAction.waitForDuration(1.0)
        let spawn = SKAction.runBlock({
            let logs = Logs()
            self.worldNode.addChild(logs)
        })
        let spawnSequence = SKAction.sequence([delay, spawn])
        worldNode.runAction(SKAction.repeatActionForever(spawnSequence), withKey: kNameSpawn)
    }
    
    func switchToGameOver() {
        state = GameState.GameOver
        
        // Stop scrolling and flash/shake background
        self.flashBackground()
        ground.stopGround()
        hills.stopHills()
        
        // Hide the Score HUD
        scoreHud.hidden = true
        
        // Stop the Logs
        worldNode.removeActionForKey(kNameSpawn)
        worldNode.enumerateChildNodesWithName(kNameLogs, usingBlock: { node, stop in
            node.removeAllActions()
        })
        
        // Animate smoke on player
        let smoke = Smoke()
        worldNode.addChild(smoke)
        smoke.animateSmoke(player.position)
        
        // Blink and hide player
        let blink = SKAction.sequence([SKAction.fadeOutWithDuration(0.15), SKAction.fadeInWithDuration(0.15)])
        let blinkSequence = SKAction.repeatAction(blink, count: 3)
        player.runAction(blinkSequence, completion: {
            self.player.hidden = true
        })
        
        // Game Over
        let gameOver = GameOver(score: score)
        worldNode.addChild(gameOver)
        
        // Retry Button
        retry = SKSpriteNode(texture: GameTexturesSharedInstance.textureAtlas.textureNamed("Retry"))
        retry.position = CGPoint(x: viewSize.width * 0.25, y: viewSize.height * 0.3)
        retry.zPosition = GameLayer.Interface
        worldNode.addChild(retry)
        
        // Leaders Button
        leaders = SKSpriteNode(texture: GameTexturesSharedInstance.textureAtlas.textureNamed("Leaders"))
        leaders.position = CGPoint(x: viewSize.width * 0.75, y: viewSize.height * 0.3)
        leaders.zPosition = GameLayer.Interface
        worldNode.addChild(leaders)

    }
    
    func switchToNewGame() {
        let gameScene = GameScene(size: viewSize)
        gameScene.scaleMode = SKSceneScaleMode.AspectFill
        let gameTransition = SKTransition.fadeWithColor(SKColor.blackColor(), duration: 0.25)
        self.view.presentScene(gameScene, transition: gameTransition)
    }
    
    func flashBackground() {
        let shake = SKAction.screenShakeWithNode(worldNode, amount: CGPoint(x: 20, y: 15), oscillations: 10, duration: 0.75)
        let colorBackground = SKAction.runBlock({
            self.backgroundColor = SKColor.redColor()
            self.runAction(SKAction.waitForDuration(0.5), completion: {
                self.backgroundColor = SKColorFromRBG(kBGColor)
            })
        })
        let flashGroup = SKAction.group([shake, colorBackground])
        self.runAction(flashGroup)
    }
    
    // MARK: Score
    func updateScore() {
        score++
        scoreHud.text = NSString(format: "%d", score)
        worldNode.runAction(GameSoundsSharedInstance.coin)
        
        if score % 5 == 0 {
            worldNode.runAction(GameSoundsSharedInstance.oink)
        }
    }
}
