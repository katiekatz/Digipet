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
//    let gameScene = SKScene(fileNamed: "GameScene")
    
    override func didMove(to view: SKView) {

        //back arrow
        backArrow = childNode(withName: "//backArrow") as! SKSpriteNode

    }
    
    func goToScene(scene: SKScene) {
        let sceneTransition = SKTransition.push(with: .right, duration: 0.5)
        scene.scaleMode = .aspectFill
        self.view?.presentScene(scene, transition: sceneTransition)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let touchLocation = touch.location(in: self)
        
        if backArrow.contains(touchLocation) {
            let scene:SKScene = SKScene(fileNamed: "GameScene")!
            goToScene(scene: scene)
        }
        
    }
}
