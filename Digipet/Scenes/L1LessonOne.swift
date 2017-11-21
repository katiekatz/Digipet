//
//  LessonOne.swift
//  Digipet
//
//  Created by Nicholas Kassoy on 11/17/17.
//  Copyright © 2017 Katie Katz. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit
import Foundation

class L1LessonOne: SKScene {
    var Pet = SKSpriteNode()
    var talkButton: SKSpriteNode!
    
    func goToScene(scene: SKScene) {
        let sceneTransition = SKTransition.push(with: .left, duration: 0.5)
        scene.scaleMode = .aspectFill
        self.view?.presentScene(scene, transition: sceneTransition)
    }
    
    override func didMove(to view: SKView) {
        Pet = SKSpriteNode(imageNamed: "china")
        Pet.size = CGSize(width: 375, height: 518)
        Pet.zPosition = 1.0
        Pet.position = CGPoint(x: self.frame.size.width, y: self.frame.size.height * -0.388)
        addChild(Pet)
        
        talkButton = childNode(withName: "//talkButton") as! SKSpriteNode
        talkButton.isHidden = true
        
        entranceAnimation()
    }
    
    func entranceAnimation() {
        let action = SKAction(named: "WalkIn")
        Pet.run(action!)
        
        sleep(1)
        talkButton.isHidden = true
        
    }
}

