//
//  MenuScene.swift
//  PippinFree
//
//  Created by Jeremy Novak on 8/14/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    
    private let textures = GameTexturesSharedInstance
    private var viewSize:CGSize!
    
    private var playButton = SKSpriteNode()
    
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    override func didMoveToView(view: SKView) {
        viewSize = self.frame.size
        
        self.setupMenu()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    }
    
    override func update(currentTime: CFTimeInterval) {
    }
    
    func setupMenu () {
        // Background Color
        self.backgroundColor = SKColorFromRBG(kBGColor)
        
        // Sun
        let sun = SKSpriteNode(texture: textures.textureAtlas.textureNamed("Sun"))
        sun.position = CGPoint(x: viewSize.width * 0.15, y: viewSize.height * 0.8)
        self.addChild(sun)
        
        // Foreground
        let foreground = Foreground()
        self.addChild(foreground)
        
        // Game Logo
        let logo = SKSpriteNode(imageNamed: "Logo")
        logo.position = CGPoint(x: viewSize.width / 2, y: viewSize.height * 0.6)
        self.addChild(logo)
        
        // Play Button
        playButton = SKSpriteNode(texture: textures.textureAtlas.textureNamed("Play"))
        playButton.position = CGPoint(x: viewSize.width / 2, y: viewSize.height * 0.25)
        self.addChild(playButton)
        
    }
}