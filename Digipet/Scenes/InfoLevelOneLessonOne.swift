//
//  InfoLevelOneLessonOne.swift
//  Digipet
//
//  Created by Katie Katz on 1/26/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import UIKit

class InfoLevelOneLessonOne: SKScene {

    var box: LessonInfoBox!
    
    override func didMove(to view: SKView) {
        box = LessonInfoBox(lN: "Greetings", v1: "hola hola hola hola hola", v2: "你好 你好 你好", v3: "bonjour bonjour bonjour", d1: "greetings are for losers", d2: "mime your way through existence", d3: "until your inevitable demise.", moveTo: "L1LessonOne")
        
        box.position = CGPoint(x: 75, y: 375)
        self.addChild(box)
    }
    
    func pushToScene(scene: SKScene, direction: SKTransitionDirection) {
        let sceneTransition = SKTransition.push(with: direction, duration: 0.5)
        scene.scaleMode = .aspectFill
        self.view?.presentScene(scene, transition: sceneTransition)
    }
    
    func fadeToScene(scene: SKScene) {
        let sceneTransition = SKTransition.fade(with: .white, duration: 0.5)
        scene.scaleMode = .aspectFill
        self.view?.presentScene(scene, transition: sceneTransition)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let touchLocation = touch.location(in: self)
        
        let nodes = self.nodes(at: touchLocation)
        
        if !nodes.contains(box) {
            let scene:SKScene = SKScene(fileNamed: "LevelOne")!
            fadeToScene(scene: scene)
        }
        
//        if nodes.contains(box.typeButton) {
//            let scene:SKScene = SKScene(fileNamed: "L1LessonOne")!
//            pushToScene(scene: scene, direction: .left)
//        }
        
    }
}
