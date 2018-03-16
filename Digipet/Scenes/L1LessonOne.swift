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
    var sBubble1: SKSpriteNode!
    var sBubble2: SKSpriteNode!
    var pet1Text: SKLabelNode!
    var pet2Text: SKLabelNode!
    var pet2Text2: SKLabelNode!
    
    var talkButton: SKSpriteNode!
    var headerText: SKLabelNode!
    var backArrow: SKSpriteNode!
    
    var array: [() -> ()] = []
    var counter: Int = 0
    
    override func didMove(to view: SKView) {
        Pet1 = SKSpriteNode(imageNamed: "china")
        Pet1.size = CGSize(width: 375, height: 518)
        Pet1.zPosition = 1.0
        Pet1.position = CGPoint(x: self.frame.size.width, y: self.frame.size.height * -0.388)
        addChild(Pet1)
        
        Pet2 = SKSpriteNode(imageNamed: "china")
        Pet2.size = CGSize(width: 321, height: 444)
        Pet2.color = UIColor.red
        Pet2.colorBlendFactor = 0.5
        Pet2.zPosition = 1.0
        Pet2.position = CGPoint(x: self.frame.size.width, y: self.frame.size.height * -0.388 + 74)
        addChild(Pet2)
        
        talkButton = childNode(withName: "//talkButton") as! SKSpriteNode
        talkButton.isHidden = true
        
        sBubble1 = childNode(withName: "//sBubble1") as! SKSpriteNode
        sBubble1.isHidden = true
        
        sBubble2 = childNode(withName: "//sBubble2") as! SKSpriteNode
        sBubble2.isHidden = true
        
        pet1Text = childNode(withName: "//pet1Text") as! SKLabelNode
        pet1Text.isHidden = true
        
        pet2Text = childNode(withName: "//pet2Text") as! SKLabelNode
        pet2Text.isHidden = true
        pet2Text2 = childNode(withName: "//pet2Text2") as! SKLabelNode
        pet2Text2.isHidden = true
        
        headerText = childNode(withName: "//headerText") as! SKLabelNode
        headerText.fontName = "Plumpfull"
        headerText.isHidden = true
        
        backArrow = childNode(withName: "//backArrow") as! SKSpriteNode
        
        array = [firstQuestion, sunrise, askQuestion, andYou, pet3, doYouSpeak, howDoYouSay, howDoYouSay2, thank, goodbye]
        
        runLesson()
    }
    
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
    
    func runLesson() {
          entranceAnimation()
    }
    
    func entranceAnimation() {
        let action = SKAction(named: "WalkIn")
        Pet1.run(action!)
        
        Timer.scheduledTimer(withTimeInterval: 4.5, repeats: false) {
            timer in
            
            self.sBubble1.isHidden = false
            self.pet1Text.text = "Hello!"
            self.pet1Text.isHidden = false
            
            Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) {
                timer in
                
                self.talkButton.isHidden = false
            }
        }
        
    }
    
    func firstQuestion() {
        talkButton.isHidden = true
        self.pet1Text.text = "How are you?"
        Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
            
                    self.talkButton.isHidden = false
                }
    }
    
    func sunrise() {
        talkButton.isHidden = true
        self.pet1Text.text = "Welcome!"
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) {
            timer in
            self.pet1Text.text = "Pet!"
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
                    
                    self.pet2Text.text = "Good Morning!"
                    self.pet2Text.isHidden = false
                    self.sBubble2.isHidden = false
                    Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
                    
                    self.talkButton.isHidden = false
                }
                }
                
            }

        }
    }
    
    func askQuestion() {
        talkButton.isHidden = true
        headerText.isHidden = false
        Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
            
                    self.talkButton.isHidden = false
                }
    }
    
    func andYou() {
        talkButton.isHidden = true
        pet2Text.text = "I'm good,"
        pet2Text2.text = "and you?"
        pet2Text2.isHidden = false
        Timer.scheduledTimer(withTimeInterval: 0.7, repeats: false) {
            timer in
            self.headerText.text = "😐"
            Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
                
                    self.talkButton.isHidden = false
                }
        }
    }
    
    func pet3() {
        talkButton.isHidden = true
        Pet2.run(SKAction(named: "WalkOut")!)
        pet2Text.text = ""
        pet2Text2.text = ""
        pet2Text.isHidden = true
        pet2Text2.isHidden = true
        sBubble2.isHidden = true
        
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) {
            timer in
            
            self.Pet2.run(SKAction(named: "WalkIn1")!)
            
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) {
                timer in
                self.pet2Text.isHidden = false
                self.pet2Text2.isHidden = false
                self.sBubble2.isHidden = false
                self.pet2Text.text = "Good afternoon."
                Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
                    
                    self.talkButton.isHidden = false
                }
            }
            
        }
        
    }
    
    func doYouSpeak() {
        talkButton.isHidden = true
        pet2Text.text = "Do you speak"
        pet2Text2.text = "_______?"
        Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
            
                    self.talkButton.isHidden = false
                }
    }
    
    func howDoYouSay() {
        talkButton.isHidden = true
        pet2Text.text = "How do you say"
        pet2Text2.text =  "\"sorry\"?"
        Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
            
                    self.talkButton.isHidden = false
                }
    }
    
    func howDoYouSay2() {
        talkButton.isHidden = true
        pet2Text.text = "And how do you"
        pet2Text2.text = "say \"It's okay\"?"
        Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
            
                    self.talkButton.isHidden = false
                }

    }
    
    func thank() {
        talkButton.isHidden = true
        pet2Text.text = "Thank you!"
        pet2Text2.text = ""
        Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
            
                    self.talkButton.isHidden = false
                }
    }
    
    func goodbye() {
        talkButton.isHidden = true
        pet1Text.text = "Goodbye!"
        Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
            
                    self.talkButton.isHidden = false
                }
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

