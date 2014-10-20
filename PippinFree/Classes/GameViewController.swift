//
//  GameViewController.swift
//  PippinFree
//
//  Created by Jeremy Novak on 8/14/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    //internal var bannerView = GADBannerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if kShowAds {
//            let origin = CGPoint(x: 0.0, y: self.view.frame.size.height - CGSizeFromGADAdSize(kGADAdSizeSmartBannerPortrait).height)
//            bannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait, origin: origin)
//            bannerView.adUnitID = "ca-app-pub-8485086565892981/1647457356"
//            bannerView.delegate = self
//            bannerView.rootViewController = self
//            self.view.addSubview(bannerView)
//            
//            let request = GADRequest()
//            request.testDevices = ["75484efdafe56d15973415854b1000e5", "820330c15264279191df0cb37ba81e4e", "6f21763c916d7f9d8075dfe758ad5e99", "9679a898cc76ba5c017760c525f231c5"]
//            bannerView.loadRequest(request)
//        }
        
    }
    
    override func viewWillLayoutSubviews() {
        var viewSize = UIScreen.mainScreen().bounds.size
        
        let skView = self.view as SKView
        skView.ignoresSiblingOrder = true
        
        if kDebug {
            skView.showsFPS = true
            skView.showsNodeCount = true
            skView.showsDrawCount = true
            skView.showsPhysics = true
            println(viewSize)
        }
        
        let menuScene = MenuScene(size: viewSize)
        menuScene.scaleMode = SKSceneScaleMode.AspectFill
        skView.presentScene(menuScene)
    }

    // Hide the status bar
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    // Autorotate the view
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    // Supported orientations
    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad {
            return Int(UIInterfaceOrientationMask.Portrait.toRaw() | UIInterfaceOrientationMask.PortraitUpsideDown.toRaw())
        } else {
            return Int(UIInterfaceOrientationMask.Portrait.toRaw())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
