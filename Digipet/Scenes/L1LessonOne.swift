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
    var Pet1: SKSpriteNode!
    var Pet2: SKSpriteNode!
    var talkButton: SKSpriteNode!
    var sBubble: SKSpriteNode!
    var petText: SKLabelNode!
    let group = DispatchGroup()
    
    func goToScene(scene: SKScene) {
        let sceneTransition = SKTransition.push(with: .left, duration: 0.5)
        scene.scaleMode = .aspectFill
        self.view?.presentScene(scene, transition: sceneTransition)
    }
    
    override func didMove(to view: SKView) {
        Pet1 = SKSpriteNode(imageNamed: "china")
        Pet1.size = CGSize(width: 375, height: 518)
        Pet1.zPosition = 1.0
        Pet1.position = CGPoint(x: self.frame.size.width, y: self.frame.size.height * -0.388)
        addChild(Pet1)
        
        talkButton = childNode(withName: "//talkButton") as! SKSpriteNode
        talkButton.isHidden = true
        
        sBubble = childNode(withName: "//sBubble") as! SKSpriteNode
        sBubble.isHidden = true
        
        petText = childNode(withName: "//petText") as! SKLabelNode
        petText.isHidden = true
        
        self.group.enter()
        entranceAnimation()
        self.group.enter()
        firstQuestion()
        secondPet()
    }
    
    func input() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        return (NSString(data: inputData, encoding: String.Encoding.utf8.rawValue)! as String)
    }
    
    func entranceAnimation() {
        let action = SKAction(named: "WalkIn")
        Pet1.run(action!)
        
        Timer.scheduledTimer(withTimeInterval: 4.5, repeats: false) {
            timer in
            
            self.sBubble.isHidden = false
            self.petText.text = "Hello!"
            self.petText.isHidden = false
            
            Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) {
                timer in
                
                self.talkButton.isHidden = false
                self.firstQuestion()
                
                self.group.leave()
            }
        }
        
//        let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
//        DispatchQueue.main.asyncAfter(deadline: when) {
//            self.sBubble.isHidden = false
//            self.petText.isHidden = false
//        }
//
//        self.talkButton.isHidden = false
        
    }
    
    func firstQuestion() {
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) {
            timer in
            self.petText.text = "How are you?"
            
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) {
                timer in
                self.petText.text = "Welcome!"
                
                self.group.leave()
            }
        }
        
    }
    
    func secondPet() {
        Pet2 = SKSpriteNode(imageNamed: "china")
        Pet2.size = CGSize(width: 375  * (2/3), height: 518 * (2/3))
        Pet2.zPosition = 1.0
        Pet2.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height * -0.388)
        addChild(Pet2)
    }
    
//    @IBAction func doSomething(sender: SKSpriteNode!) {
//        let propertyToCheck = sender.
//        switch propertyToCheck {
//        case: "caseOne"
//        // do something
//        case: "caseTwo"
//        // do something else
//        default: break
//        }
//    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touch = touches.first else { return }
//
//        let touchLocation = touch.location(in: self)
//
//        if talkButton.contains(touchLocation) {
//            self.petText.text = "Welcome!"
//        }
//    }
    
    func showButton() {
        talkButton.isHidden = false
    }
}

