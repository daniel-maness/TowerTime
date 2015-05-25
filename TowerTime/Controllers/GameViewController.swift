//
//  GameViewController.swift
//  TowerTime
//
//  Created by Daniel Maness on 5/20/15.
//  Copyright (c) 2015 Daniel Maness. All rights reserved.
//

import UIKit
import SpriteKit

extension SKNode {
    class func unarchiveFromFile(file : String) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            var sceneData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)!
            var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! GameScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

class GameViewController: UIViewController, TowerDelegate {
    var scene: GameScene?
    var towerManager: TowerManager?
    
    @IBOutlet weak var attackButton1: UIButton!
    @IBOutlet weak var attackButton2: UIButton!
    @IBOutlet weak var attackButton3: UIButton!
    @IBOutlet weak var attackButton4: UIButton!
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var enemyImage1: UIImageView!
    @IBOutlet weak var enemyImage2: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the view.
        let skView = self.view as! SKView
        skView.multipleTouchEnabled = false
        
        // Create and configure the scene
        scene = GameScene(size: skView.bounds.size)
        scene?.scaleMode = .AspectFill
        //scene.tick = didTick()
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        var hero = Hero()
        towerManager = TowerManager()
        towerManager?.delegate = self
        towerManager?.beginGame()
        
        skView.presentScene(scene)
    }
    
    func didTick() {
        
    }
    
    func gameDidBegin(towerManager: TowerManager) {
        
    }
    
    func gameDidEnd(towerManager: TowerManager) {
        
    }
    
    func gameDidLevelUp(towerManager: TowerManager) {
        
    }
    
    func gameCharacterDidSpawn(towerManager: TowerManager) {
        
    }
    
    func gameCharacterDidAct(towerManager: TowerManager) {
        
    }
    
    func gameCharacterDidDie(towerManager: TowerManager) {
        
    }

    override func shouldAutorotate() -> Bool {
        return false
    }

    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
        } else {
            return Int(UIInterfaceOrientationMask.All.rawValue)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
