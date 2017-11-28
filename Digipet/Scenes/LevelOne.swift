//
//  LevelOne.swift
//  Digipet
//
//  Created by Katie Katz on 11/17/17.
//  Copyright © 2017 Katie Katz. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class LevelOne: SKScene {
    
    var backArrow: SKSpriteNode!
    var menuIcon: SKSpriteNode!
    var lessonsText: SKLabelNode!
    var levelText: SKLabelNode!
    var oneText: SKLabelNode!

    
    override func didMove(to view: SKView) {
        backArrow = childNode(withName: "//backArrow") as! SKSpriteNode
        menuIcon = childNode(withName: "//menuIcon") as! SKSpriteNode
        lessonsText = childNode(withName: "//lessonsText") as! SKLabelNode
        levelText = childNode(withName: "//levelText") as! SKLabelNode
        oneText = childNode(withName: "//oneText") as! SKLabelNode
        backArrow.position = CGPoint(x: 92, y: 1267)
        menuIcon.position = CGPoint(x: 658, y: 1267)
        lessonsText.position = CGPoint(x: 375, y: 1033)
        levelText.position = CGPoint(x: 350, y: 1133)
        oneText.position = CGPoint(x: 525, y: 1133)
    }
    
    func pushToScene(scene: SKScene, direction: SKTransitionDirection) {
        let sceneTransition = SKTransition.push(with: direction, duration: 0.5)
        scene.scaleMode = .aspectFill
        self.view?.presentScene(scene, transition: sceneTransition)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let touchLocation = touch.location(in: self)
        
        if backArrow.contains(touchLocation) {
            let scene:SKScene = SKScene(fileNamed: "LearnPage")!
            pushToScene(scene: scene, direction: .right)
        }
    
        
    }
    
}
