//
//  GameScene.swift
//  TowerTime
//
//  Created by Daniel Maness on 5/20/15.
//  Copyright (c) 2015 Daniel Maness. All rights reserved.
//

import SpriteKit

let tickLength = NSTimeInterval(600)

class GameScene: SKScene {
    var tick: (() -> ())?
    var tickLengthMillis = tickLength
    var lastTick: NSDate?
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        self.backgroundColor = UIColor.whiteColor()
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if lastTick == nil {
            return
        }
        
        var timePassed = lastTick!.timeIntervalSinceNow * -1000.0
        if timePassed > tickLengthMillis {
            lastTick = NSDate()
            tick?()
        }
    }
    
    func startTicking() {
        lastTick = NSDate()
    }
    
    func stopTicking() {
        lastTick = nil
    }
}
