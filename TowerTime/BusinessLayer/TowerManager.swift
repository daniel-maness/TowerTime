//
//  TowerManager.swift
//  TowerTime
//
//  Created by Daniel Maness on 5/21/15.
//  Copyright (c) 2015 Daniel Maness. All rights reserved.
//

import Foundation

class Character {
    
}

class Enemy: Character {
    
}

class Hero: Character {
    
}

protocol TowerDelegate {
    func gameDidBegin(towerManager: TowerManager)
    
    func gameDidEnd(towerManager: TowerManager)
    
    func gameDidLevelUp(towerManager: TowerManager)
    
    func gameCharacterDidSpawn(towerManager: TowerManager)
    
    func gameCharacterDidAct(towerManager: TowerManager)
    
    func gameCharacterDidDie(towerManager: TowerManager)
}

class TowerManager {
    let levelTicks = 30000
    var delegate: TowerDelegate?
    var enemyArray: [Enemy]?
    var hero: Hero
    var maxTicks: Int
    var currentTick: Int
    var totalSeconds: Int
    var startingLevel: Int
    var currentLevel: Int
    var levelGoldSum: Int
    var towerGoldSum: Int
    
    init() {
        self.hero = Hero()
        self.maxTicks = levelTicks
        self.currentTick = maxTicks
        self.totalSeconds = 0
        self.startingLevel = 1
        self.currentLevel = 1
        self.levelGoldSum = 0
        self.towerGoldSum = 0
    }
    
    func beginGame() {
        delegate?.gameDidBegin(self)
    }
    
    func endGame() {
        delegate?.gameDidEnd(self)
    }
    
    func newEnemies() -> [Enemy] {
        var enemies = [Enemy]()
        
        return enemies
    }
    
    func heroAction() {
        
    }
    
    func enemyAction() {
        
    }
    
    func characterAction() {
        
    }
}