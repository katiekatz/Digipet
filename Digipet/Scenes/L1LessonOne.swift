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
    var sBubble2: SKSpriteNode!
    var petText: SKLabelNode!
    var petText2: SKLabelNode!
    var petText22: SKLabelNode!
    var headerText: SKLabelNode!
    let group = DispatchGroup()
    var array: [() -> ()] = []
    var counter: Int = 0
    var animationRunning = false
    var backArrow: SKSpriteNode!
    
    func goToScene(scene: SKScene) {
        let sceneTransition = SKTransition.push(with: .left, duration: 0.5)
        scene.scaleMode = .aspectFill
        self.view?.presentScene(scene, transition: sceneTransition)
    }
    
    func input() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        return (NSString(data: inputData, encoding: String.Encoding.utf8.rawValue)! as String)
    }
    
    override func didMove(to view: SKView) {
        Pet1 = SKSpriteNode(imageNamed: "china")
        Pet1.size = CGSize(width: 375, height: 518)
        Pet1.zPosition = 1.0
        Pet1.position = CGPoint(x: self.frame.size.width, y: self.frame.size.height * -0.388)
        addChild(Pet1)
        
        Pet2 = SKSpriteNode(imageNamed: "china")
        Pet2.size = CGSize(width: 321, height: 444)
        Pet2.zPosition = 1.0
        Pet2.position = CGPoint(x: self.frame.size.width, y: self.frame.size.height * -0.388 + 74)
        addChild(Pet2)
        
        talkButton = childNode(withName: "//talkButton") as! SKSpriteNode
        talkButton.isHidden = true
        
        sBubble = childNode(withName: "//sBubble") as! SKSpriteNode
        sBubble.isHidden = true
        
        sBubble2 = childNode(withName: "//sBubble2") as! SKSpriteNode
        sBubble2.isHidden = true
        
        petText = childNode(withName: "//petText") as! SKLabelNode
        petText.isHidden = true
        
        petText2 = childNode(withName: "//petText2") as! SKLabelNode
        petText2.isHidden = true
        petText22 = childNode(withName: "//petText22") as! SKLabelNode
        petText22.isHidden = true
        
        headerText = childNode(withName: "//headerText") as! SKLabelNode
        headerText.fontName = "Plumpfull"
        headerText.isHidden = true
        
        backArrow = childNode(withName: "//backArrow") as! SKSpriteNode
        
        array = [firstQuestion, sunrise, askQuestion, andYou, pet3, doYouSpeak, howDoYouSay, howDoYouSay2, thank, goodbye]
        
        runLesson()
    }
    
    func runLesson() {
//        self.group.enter()
          entranceAnimation()
//
//        self.group.enter()
//        firstQuestion()
//
//        self.group.enter()
//        secondPet()
    }
    
    func entranceAnimation() {
        animationRunning = true
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
                
                self.animationRunning = false
//                self.group.leave()
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
        self.petText.text = "How are you?"
//        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) {
//            timer in
//        }
    }
    
    func sunrise() {
        self.petText.text = "Welcome!"
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) {
            timer in
            self.petText.text = "Pet!"
            self.Pet2.run(SKAction(named: "WalkIn1")!)
            
            Timer.scheduledTimer(withTimeInterval: 5, repeats: false) {
                timer in
                let dayBackground = SKSpriteNode(imageNamed: "daybackground")
                dayBackground.zPosition = -0.5
                dayBackground.position = CGPoint(x: 0, y: 0)
                dayBackground.alpha = 0
                self.addChild(dayBackground)
                
                let dayWall = SKSpriteNode(imageNamed: "wallday")
                dayWall.zPosition = 0.5
                dayWall.position = CGPoint(x: 0, y: 0)
                dayWall.alpha = 0
                self.addChild(dayWall)
                
                dayWall.run(SKAction(named: "Sunrise")!)
                dayBackground.run(SKAction(named: "Sunrise")!)
                
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {
                    timer in
                    
                    self.petText2.text = "Good Morning!"
                    self.petText2.isHidden = false
                    self.sBubble2.isHidden = false
                }
                
            }

        }
    }
    
    func askQuestion() {
        headerText.isHidden = false
    }
    
    func andYou() {
        petText2.text = "I'm good,"
        petText22.text = "and you?"
        petText22.isHidden = false
        Timer.scheduledTimer(withTimeInterval: 0.7, repeats: false) {
            timer in
            self.headerText.text = "😐"
        }
    }
    
    func pet3() {
        Pet2.run(SKAction(named: "WalkOut")!)
        petText2.text = ""
        petText22.text = ""
        petText2.isHidden = true
        petText22.isHidden = true
        sBubble2.isHidden = true
        
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) {
            timer in
            
            self.Pet2.run(SKAction(named: "WalkIn1")!)
            
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) {
                timer in
                self.petText2.isHidden = false
                self.petText22.isHidden = false
                self.sBubble2.isHidden = false
                self.petText2.text = "Good afternoon."
            }
            
        }
        
    }
    
    func doYouSpeak() {
        petText2.text = "Do you speak"
        petText22.text = "_______?"
    }
    
    func howDoYouSay() {
        petText2.text = "How do you say"
        petText22.text =  "\"sorry\"?"
    }
    
    func howDoYouSay2() {
        petText2.text = "And how do you"
        petText22.text = "say \"It's okay\"?"

    }
    
    func thank() {
        petText2.text = "Thank you!"
        petText22.text = ""
    }
    
    func goodbye() {
        petText.text = "Goodbye!"
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
    
    func pushToScene(scene: SKScene, direction: SKTransitionDirection) {
        let sceneTransition = SKTransition.push(with: direction, duration: 0.5)
        scene.scaleMode = .aspectFill
        self.view?.presentScene(scene, transition: sceneTransition)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }

        let touchLocation = touch.location(in: self)

        if talkButton.contains(touchLocation) {
            if counter < array.count {
                self.array[counter]()
                counter += 1
            }
        }
        if backArrow.contains(touchLocation) {
            let scene:SKScene = SKScene(fileNamed: "GameScene")!
            pushToScene(scene: scene, direction: .right)
        }
    }
    
}

