//
//  Homepage.swift
//  Digipet
//
//  Created by Katie Katz on 10/23/17.
//  Copyright © 2017 Katie Katz. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class Homepage: SKScene {
    var playButton: SKSpriteNode!
    var learnButton: SKSpriteNode!
    var settingsButton: SKSpriteNode!
    let playPage = SKScene(fileNamed: "PlayPage")
    let learnPage = SKScene(fileNamed: "LearnPage")
    let settingsPage = SKScene(fileNamed: "SettingsPage")
    
    func goToScene(scene: SKScene) {
        //let sceneTransition = SKTransition.fade(with: UIColor.darkGray, duration: 1)
        //let sceneTransition = SKTransition.moveIn(with: .right, duration: 0.5)
        let sceneTransition = SKTransition.push(with: .left, duration: 0.5)
        scene.scaleMode = .aspectFill
        self.view?.presentScene(scene, transition: sceneTransition)
    }
    
    override func didMove(to view: SKView) {
        playButton = childNode(withName: "//playButton") as! SKSpriteNode
        learnButton = childNode(withName: "//learnButton") as! SKSpriteNode
        settingsButton = childNode(withName: "//settingsButton") as! SKSpriteNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let touchLocation = touch.location(in: self)
        
        if playButton.contains(touchLocation) {
            let transition:SKTransition = SKTransition.fade(with: UIColor.darkGray, duration: 1)
            let scene:SKScene = playPage!
            self.view?.presentScene(scene, transition: transition)
        } else if learnButton.contains(touchLocation) {
            //let transition:SKTransition = SKTransition.fade(with: UIColor.darkGray, duration: 1)
            let scene:SKScene = learnPage!
            //self.view?.presentScene(scene, transition: transition)
            goToScene(scene: scene)
        } else if settingsButton.contains(touchLocation) {
            let transition:SKTransition = SKTransition.fade(with: UIColor.darkGray, duration: 1)
            let scene:SKScene = settingsPage!
            self.view?.presentScene(scene, transition: transition)
        }

    }
    
}
