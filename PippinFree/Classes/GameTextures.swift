//
//  GameTextures.swift
//  PippinFree
//
//  Created by Jeremy Novak on 8/15/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import SpriteKit

let GameTexturesSharedInstance = GameTextures()

class GameTextures {
    
    class var sharedInstance:GameTextures {
        return GameTexturesSharedInstance
    }
    
    internal var textureAtlas = SKTextureAtlas()
    
    init () {
        textureAtlas = SKTextureAtlas(named: "Artwork")
    }
    
}
