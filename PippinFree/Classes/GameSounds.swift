//
//  GameSounds.swift
//  PippinFree
//
//  Created by Jeremy Novak on 8/15/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import AVFoundation
import SpriteKit

let GameSoundsSharedInstance = GameSounds()

class GameSounds {
    
    class var sharedInstance:GameSounds {
        return GameSoundsSharedInstance
    }
    
    // Background Music Player
    internal var musicPlayer:AVAudioPlayer!
    
    // Sound Effect SKActions
    internal var soundEffects = [SKAction]()
    internal var bounce = SKAction.playSoundFileNamed(kSoundBounce, waitForCompletion: false)
    internal var coin = SKAction.playSoundFileNamed(kSoundCoin, waitForCompletion: false)
    internal var falling = SKAction.playSoundFileNamed(kSoundFalling, waitForCompletion: false)
    internal var flying = SKAction.playSoundFileNamed(kSoundFlying, waitForCompletion: false)
    internal var hitGround = SKAction.playSoundFileNamed(kSoundOink, waitForCompletion: false)
    internal var oink = SKAction.playSoundFileNamed(kSoundOink, waitForCompletion: false)
    internal var pop = SKAction.playSoundFileNamed(kSoundPop, waitForCompletion: false)
    internal var whack = SKAction.playSoundFileNamed(kSoundWhack, waitForCompletion: false)
    
    
    init () {
        soundEffects = [bounce, coin, falling, flying, hitGround, oink, pop, whack]
    }
    
    func playBackgroundMusic(filename: String) {
        let gameMusic = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(kMusicGame, ofType: nil)!)
        var playerError:NSError?
        
        musicPlayer = AVAudioPlayer(contentsOfURL: gameMusic, error: &playerError)
        //musicPlayer.delegate = self
        musicPlayer.numberOfLoops = -1
        musicPlayer.volume = 0.75
        musicPlayer.prepareToPlay()
        musicPlayer.play()
    }
    
    func stopBackgroundMusic () {
        if musicPlayer.playing {
            musicPlayer.stop()
        }
    }
    
    func pauseBackgroundMusic () {
        if musicPlayer.playing {
            musicPlayer.pause()
        }
    }
    
    func resumeBackgroundMusic () {
        if !musicPlayer.playing {
            musicPlayer.play()
        }
    }
}
