//
//  StartLevelOneLessonOne.swift
//  Digipet
//
//  Created by Katie Katz on 1/11/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class StartLevelOneLessonOne: SKScene {
    
    var backArrow: SKSpriteNode!
    var menuIcon: SKSpriteNode!
    var box: LessonStartBox!
    var petImg: SKSpriteNode!

    
    override func didMove(to view: SKView) {
        backArrow = SKSpriteNode(texture: SKTexture(imageNamed: "arrowicon"))
        menuIcon = SKSpriteNode(texture: SKTexture(imageNamed: "menuicon"))
        box = LessonStartBox(lN: "LESSON 1", l1: "holja", l2: "bonjour", l3: "你好", l4: "ciaojh")
        petImg = SKSpriteNode(texture: SKTexture(imageNamed: "china"), size: CGSize(width: 300, height: 420))

        backArrow.position = CGPoint(x: 92, y: 1267)
        menuIcon.position = CGPoint(x: 658, y: 1267)
        box.position = CGPoint(x: 75, y: 275)
        petImg.position = CGPoint(x: 375, y: 875)
        self.addChild(backArrow)
        self.addChild(menuIcon)
        self.addChild(box)
        self.addChild(petImg)
    }
    
    func pushToScene(scene: SKScene, direction: SKTransitionDirection) {
        let sceneTransition = SKTransition.push(with: direction, duration: 0.5)
        scene.scaleMode = .aspectFill
        self.view?.presentScene(scene, transition: sceneTransition)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let touchLocation = touch.location(in: self)
        
        let nodes = self.nodes(at: touchLocation)
        
        if backArrow.contains(touchLocation) {
            let scene:SKScene = SKScene(fileNamed: "LevelOne")!
            pushToScene(scene: scene, direction: .right)
        }
        
        if nodes.contains(box.typeButton) {
            let scene:SKScene = SKScene(fileNamed: "L1LessonOne")!
            pushToScene(scene: scene, direction: .left)
        }
        

        
    }
}
