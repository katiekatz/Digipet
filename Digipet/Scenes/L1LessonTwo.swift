//
//  L1LessonTwo.swift
//  Digipet
//
//  Created by Nicholas Kassoy on 1/26/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit
import Foundation

class L1LessonTwo: SKScene {
    var Pet1: SKSpriteNode!
    var Pet2: SKSpriteNode!
    var sBubble1: SKSpriteNode!
    var pet1Text1: SKLabelNode!
    var pet1Text2: SKLabelNode!
    
    var frameText1, frameText2, frameText3, frameText4, frameText5, frameText6, frameText7, frameText8, frameText9: SKLabelNode!
    var frameText: [SKLabelNode]!
    
    var talkButton: SKSpriteNode!
    var headerText: SKLabelNode!
    var backArrow: SKSpriteNode!
    
    var array: [() -> ()] = []
    var counter: Int = 0
    var animationRunning = false
    
    override func didMove(to view: SKView) {
        Pet1 = SKSpriteNode(imageNamed: "china")
        Pet1.size = CGSize(width: 375, height: 518)
        Pet1.zPosition = 1.0
        Pet1.position = CGPoint(x: self.frame.size.width, y: self.frame.size.height * -0.388)
        addChild(Pet1)
        
        Pet2 = SKSpriteNode(imageNamed: "china")
        Pet2.size = CGSize(width: 375, height: 518)
        Pet2.color = UIColor.red
        Pet2.colorBlendFactor = 0.5
        Pet2.zPosition = 1.0
        Pet2.position = CGPoint(x: self.frame.size.width, y: self.frame.size.height * -0.388)
        addChild(Pet2)

        talkButton = childNode(withName: "//talkButton") as! SKSpriteNode
        talkButton.isHidden = true
        
        sBubble1 = childNode(withName: "//sBubble1") as! SKSpriteNode
        sBubble1.isHidden = true
        
        pet1Text1 = childNode(withName: "//pet1Text1") as! SKLabelNode
        pet1Text1.isHidden = true
        
        pet1Text2 = childNode(withName: "//pet1Text2") as! SKLabelNode
        pet1Text2.isHidden = true
        
        frameText1 = childNode(withName: "//frameText1") as! SKLabelNode
        frameText1.isHidden = true
        
        frameText2 = childNode(withName: "//frameText2") as! SKLabelNode
        frameText2.isHidden = true
        
        frameText3 = childNode(withName: "//frameText3") as! SKLabelNode
        frameText3.isHidden = true
        
        frameText4 = childNode(withName: "//frameText4") as! SKLabelNode
        frameText4.isHidden = true
        
        frameText5 = childNode(withName: "//frameText5") as! SKLabelNode
        frameText5.isHidden = true
        
        frameText6 = childNode(withName: "//frameText6") as! SKLabelNode
        frameText6.isHidden = true
        
        frameText7 = childNode(withName: "//frameText7") as! SKLabelNode
        frameText7.isHidden = true
        
        frameText8 = childNode(withName: "//frameText8") as! SKLabelNode
        frameText8.isHidden = true
        
        frameText9 = childNode(withName: "//frameText9") as! SKLabelNode
        frameText9.isHidden = true
        
        frameText = [frameText1, frameText2, frameText3, frameText4, frameText5, frameText6, frameText7, frameText8, frameText9]
        
        headerText = childNode(withName: "//headerText") as! SKLabelNode
        headerText.isHidden = true
        
        backArrow = childNode(withName: "//backArrow") as! SKSpriteNode
        
        array = [math1, math2, math3, ask1, ask2, bigNumber, goodbye1, reentrance, people1, people2, goodbye2]
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
        
        Timer.scheduledTimer(withTimeInterval: 4, repeats: false) {
            timer in
            
            self.sBubble1.isHidden = false
            self.pet1Text1.text = "Hello!"
            self.pet1Text2.text = ""
            self.pet1Text1.isHidden = false
            self.pet1Text2.isHidden = false
            
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) {
                timer in
                
                self.talkButton.isHidden = false
                
            }
        }
        
    }
    
    func math1() {
        talkButton.isHidden = true
        for i in (0..<frameText.count) {
            if i % 4 == 0 {
                frameText[i].text = "🍎"
            } else {
                frameText[i].text = " "
            }
        }
        
        for text in frameText {
            text.isHidden = false
        }
        
        pet1Text1.text = "I have"
        pet1Text2.text = "three apples!"
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) {
            timer in
            
            self.frameText[0].text = " "
            self.frameText[8].text = " "
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {
                timer in
                
                self.pet1Text1.text = "How many apples"
                self.pet1Text2.text = "do I have?"
                
                Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
                    
                    self.talkButton.isHidden = false
                }
            }
            
        }
        
    }
    
    func math2() {
        talkButton.isHidden = true
        
        for i in (0..<frameText.count) {
            if i < 3 || i > 5 {
                frameText[i].text = "🐶"
            } else {
                frameText[i].text = " "
            }
        }
        
        pet1Text1.text = "I have"
        pet1Text2.text = "six dogs!"
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) {
            timer in
            
            self.frameText[0].text = " "
            self.frameText[2].text = " "
            self.frameText[6].text = " "
            self.frameText[8].text = " "
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {
                timer in
                
                self.pet1Text1.text = "How many dogs"
                self.pet1Text2.text = "do I have?"
                
                Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
                    
                    self.talkButton.isHidden = false
                }
            }
            
        }

    }
    
    func math3() {
        talkButton.isHidden = true
        for i in (0..<frameText.count) {
            if i % 2 == 1 {
                frameText[i].text = "🐱"
            } else {
                frameText[i].text = " "
            }
        }
        
        pet1Text1.text = "I have"
        pet1Text2.text = "four cats!"
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) {
            timer in
            
            self.frameText[4].text = "🐱"
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {
                timer in
                
                self.pet1Text1.text = "How many cats"
                self.pet1Text2.text = "do I have?"
                
                Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
                    
                    self.talkButton.isHidden = false
                }
            }
            
        }
    
    }
    
    func ask1() {
        talkButton.isHidden = true
        
        pet1Text1.text = ""
        pet1Text2.text = ""
        for text in frameText {
            text.text = " "
        }
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {
            timer in
            self.pet1Text1.text = "Ask me"
            self.pet1Text2.text = "a question!"
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {
                timer in
                
                for text in self.frameText {
                    text.text = "🚙"
                }
                
                Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
                    
                    self.talkButton.isHidden = false
                }
            }
        }
        
    }
    
    func ask2() {
        talkButton.isHidden = true
        
        pet1Text1.text = ""
        pet1Text2.text = ""
        for text in frameText {
            text.text = " "
        }
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {
            timer in
            
            self.pet1Text1.text = "Ask me"
            self.pet1Text2.text = "a question!"
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {
                timer in
                
                for i in (0..<self.frameText.count) {
                    if i < 7 {
                        self.frameText[i].text = "📖"
                    } else {
                        self.frameText[i].text = " "
                    }
                }
                
                Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
                    
                    self.talkButton.isHidden = false
                }
            }
        }

    }
    
    func bigNumber() {
        talkButton.isHidden = true
        
        pet1Text1.text = ""
        pet1Text2.text = ""
        for text in frameText {
            text.text = " "
        }
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {
            timer in
            
            self.pet1Text1.text = "How do you"
            self.pet1Text2.text = "say \"1000\"?"

                
                Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
                    
                    self.talkButton.isHidden = false
                }
        }
    }
    
    func goodbye1() {
        talkButton.isHidden = true
        
        pet1Text1.text = ""
        pet1Text2.text = ""
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {
            timer in
            
            self.pet1Text1.text = "Thank you."
            self.pet1Text2.text = "Goodbye!"
            
            Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                timer in
                
                self.talkButton.isHidden = false
            }
        }
    }
    
    func reentrance() {
        talkButton.isHidden = true
        
        pet1Text1.text = ""
        pet1Text2.text = ""
        sBubble1.isHidden = true
        
        Pet1.run(SKAction(named: "WalkOut")!)
        
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) {
            timer in
            
            self.Pet2.run(SKAction(named: "WalkIn")!)
            
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) {
                timer in
                self.sBubble1.isHidden = false
                self.pet1Text1.text = "Hello!"
                
                Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
                    
                    self.talkButton.isHidden = false
                }
            }
        }
    }
    
    func people1() {
        talkButton.isHidden = true
        
        pet1Text1.text = ""
        pet1Text2.text = ""
        for text in frameText {
            text.text = " "
        }

        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {
            timer in
            
            let people: [String] = ["🏊", "🚴"]
            for i in (0..<self.frameText.count) {
                if i == 0 || i == 5 || i == 7 {
                    self.frameText[i].text = "🏃"
                } else if i == 4 {
                    self.frameText[i].text = "🐶"
                } else {
                    let n: UInt32 = arc4random_uniform(2)
                    self.frameText[i].text = people[Int(n)]
                }
            }
            
            self.pet1Text1.text = "How many people"
            self.pet1Text2.text = "are in this picture?"
            
            Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                timer in
                
                self.talkButton.isHidden = false
            }
        }
        
    }
    
    func people2() {
        talkButton.isHidden = true
        
        pet1Text1.text = ""
        pet1Text2.text = ""
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {
            timer in
            
            self.pet1Text1.text = "How many people"
            self.pet1Text2.text = "are running?"
            
            Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                timer in
                
                self.talkButton.isHidden = false
            }
        }
    }
    
    func goodbye2() {
        talkButton.isHidden = true
        
        pet1Text1.text = ""
        pet1Text2.text = ""
        for text in frameText {
            text.text = " "
        }
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {
            timer in
            
            self.pet1Text1.text = "Great job!"
            self.pet1Text2.text = "Goodbye!"
            
            Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                timer in
                
                self.talkButton.isHidden = false
            }
        }
    }

    
    func pushToScene(scene: SKScene, direction: SKTransitionDirection) {
        let sceneTransition = SKTransition.push(with: direction, duration: 0.5)
        scene.scaleMode = .aspectFill
        self.view?.presentScene(scene, transition: sceneTransition)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let touchLocation = touch.location(in: self)
        
        if talkButton.contains(touchLocation) {
            if counter < array.count && self.animationRunning == false {
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


