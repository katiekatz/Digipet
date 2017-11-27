//
//  LearnPage.swift
//  Digipet
//
//  Created by Katie Katz on 11/6/17.
//  Copyright © 2017 Katie Katz. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class LearnPage: SKScene {
    
    var backArrow: SKSpriteNode!
    var menuIcon: SKSpriteNode!
    var oneTouch: SKSpriteNode!
    var twoTouch: SKSpriteNode!
    var threeTouch: SKSpriteNode!
    var fourTouch: SKSpriteNode!
    var fiveTouch: SKSpriteNode!
    var sixTouch: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        backArrow = childNode(withName: "//backArrow") as! SKSpriteNode
        menuIcon = childNode(withName: "//menuIcon") as! SKSpriteNode
        oneTouch = childNode(withName: "//oneTouch") as! SKSpriteNode
        twoTouch = childNode(withName: "//twoTouch") as! SKSpriteNode
        threeTouch = childNode(withName: "//threeTouch") as! SKSpriteNode
        fourTouch = childNode(withName: "//fourTouch") as! SKSpriteNode
        fiveTouch = childNode(withName: "//fiveTouch") as! SKSpriteNode
        sixTouch = childNode(withName: "//sixTouch") as! SKSpriteNode
        backArrow.position = CGPoint(x: 92, y: 1267)
        menuIcon.position = CGPoint(x: 658, y: 1267)
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
            let scene:SKScene = SKScene(fileNamed: "GameScene")!
            pushToScene(scene: scene, direction: .right)
        }
        
        if oneTouch.contains(touchLocation) {
            let scene:SKScene = SKScene(fileNamed: "LevelOne")!
            pushToScene(scene: scene, direction: .left)
        }
        
    }
}
