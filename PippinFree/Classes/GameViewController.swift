//
//  GameViewController.swift
//  PippinFree
//
//  Created by Jeremy Novak on 8/14/14.
//  Copyright (c) 2014 Jeremy Novak. All rights reserved.
//

import UIKit
import SpriteKit
import iAd

class GameViewController: UIViewController, ADBannerViewDelegate {

    #if FREE
    let bannerView = ADBannerView(adType: ADAdType.Banner)
    var bannerLoaded = false
    #endif
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        var viewSize = UIScreen.mainScreen().bounds.size
        
        let skView = self.view as SKView
        if (skView.scene == nil) {
            skView.ignoresSiblingOrder = true
            
            if kDebug {
                skView.showsFPS = true
                skView.showsNodeCount = true
                skView.showsDrawCount = true
                skView.showsPhysics = true
            }
            
            let menuScene = MenuScene(size: viewSize)
            menuScene.scaleMode = SKSceneScaleMode.AspectFill
            skView.presentScene(menuScene)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        #if FREE
            bannerView.frame = CGRectMake(0, self.view.frame.size.height - bannerView.frame.size.height, self.view.frame.size.width, bannerView.frame.size.height)
            bannerView.autoresizingMask = UIViewAutoresizing.FlexibleTopMargin | UIViewAutoresizing.FlexibleWidth
            bannerView.hidden = true
            bannerView.delegate = self
            self.view.addSubview(bannerView)
            
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "showAds", name: "AdBannerShow", object: nil)
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "hideAds", name: "AdBannerHide", object: nil)
        #endif
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
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
#if FREE
    func showAds() {
        self.bannerView.hidden = false
    }
    
    func hideAds() {
        self.bannerView.hidden = true
    }
    
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        self.bannerView.hidden = false
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        self.bannerView.hidden = false
    }
    
    func bannerViewActionDidFinish(banner: ADBannerView!) {
        let skView = self.view as SKView
        skView.scene?.paused = false
    
        GameSoundsSharedInstance.resumeBackgroundMusic()
    
        NSNotificationCenter.defaultCenter().postNotificationName("StartBounceTimer", object: nil)
    
        self.bannerView.hidden = false
    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        let skView = self.view as SKView
        skView.scene?.paused = true
    
        GameSoundsSharedInstance.pauseBackgroundMusic()
    
        NSNotificationCenter.defaultCenter().postNotificationName("StopBounceTimer", object: nil)
    
        return true
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        self.bannerView.hidden = true
    }
#endif

}
