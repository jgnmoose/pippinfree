//
//  MusicButton.swift
//  PippinFree
//
//  Created by Jeremy Novak on 10/17/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import SpriteKit

class MusicButton: SKNode {
    
    private let viewSize = UIScreen.mainScreen().bounds.size
    private var button = SKSpriteNode()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
        
        self.setupMusicButton()
    }
    
    private func setupMusicButton() {
        let texture = GameSettingsSharedInstance.musicEnabled! ? GameTexturesSharedInstance.musicOn : GameTexturesSharedInstance.musicOff
        self.button = SKSpriteNode(texture: texture)
        
        self.button.position = CGPoint(x: viewSize.width * 0.9, y: viewSize.height * 0.9)
        self.button.zPosition = GameLayer.Interface
        
        self.addChild(self.button)
    }
    
    func toggleMusic() {
        let musicSetting = !GameSettingsSharedInstance.musicEnabled
        GameSettingsSharedInstance.saveMusicEnabled(musicSetting)
        
        self.button.texture = musicSetting ? GameTexturesSharedInstance.musicOn : GameTexturesSharedInstance.musicOff
        
        musicSetting ? GameSoundsSharedInstance.playBackgroundMusic(kMusicGame) : GameSoundsSharedInstance.stopBackgroundMusic()
    }
}
