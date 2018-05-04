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
    var sBubble1: SKSpriteNode!
    var pet1Text1: SKLabelNode!
    var pet1Text2: SKLabelNode!
    var wall: SKSpriteNode!
    var pointer: SKSpriteNode!
    var picFrame: SKShapeNode!
    
    var frameText1, frameText2, frameText3, frameText4, frameText5, frameText6, frameText7, frameText8, frameText9: SKLabelNode!
    var frameText: [SKLabelNode]!

    var headerText: SKLabelNode!
    
    var walkIn: SKAction!
    var rotateAction: SKAction!
    var pointAction: SKAction!
    var walkOut: SKAction!
    
    var array: [() -> ()] = []
    var correctAnswers: [String] = []
    var counter: Int = 0
    var animationRunning = false
    
    override func didMove(to view: SKView) {
        rotateAction = SKAction.sequence([SKAction.rotate(byAngle: 0.2, duration: 0.5), SKAction.rotate(byAngle: -0.2, duration: 0.5)])
        pointAction = SKAction.repeat((SKAction.sequence([SKAction.moveBy(x: -5, y: 0, duration: 0.5), SKAction.moveBy(x: 5, y: 0, duration: 0.5)])), count: 10)
        walkOut = SKAction.move(to: CGPoint(x: self.frame.size.width * -1, y: self.frame.size.height * -0.4), duration: 2.4)
        let walkInAction: SKAction = SKAction.move(to: CGPoint(x: self.frame.size.width * 0.21, y: self.frame.size.height * -0.165), duration: 4)
        walkIn = SKAction.group([walkInAction, SKAction.repeat(rotateAction, count: 4)])
        
        
        wall = SKSpriteNode(imageNamed: "wall")
        wall.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        wall.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        wall.zPosition = 0
        wall.position = CGPoint(x: 0, y: 0)
        addChild(wall)
        
        Pet1 = SKSpriteNode(imageNamed: "china")
        Pet1.size = CGSize(width: self.frame.size.width * 0.5, height: self.frame.size.height * 0.39)
        Pet1.zPosition = 1.0
        Pet1.position = CGPoint(x: self.frame.size.width, y: self.frame.size.height * -0.388)
        addChild(Pet1)
        
        sBubble1 = SKSpriteNode(imageNamed: "speechbubble")
        sBubble1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        sBubble1.size = CGSize(width: self.frame.size.width * 0.75, height: self.frame.size.height * 0.25)
        sBubble1.zPosition = 1
        sBubble1.position = CGPoint(x: self.frame.size.width * 0.03, y: self.frame.size.height * 0.18)
        addChild(sBubble1)
        sBubble1.isHidden = true
        
        pet1Text1 = SKLabelNode()
        pet1Text1.zPosition = 2
        pet1Text1.position = CGPoint(x: sBubble1.position.x, y: sBubble1.position.y + (sBubble1.position.y * 0.1))
        pet1Text1.fontColor = UIColor.black
        pet1Text1.fontName = "Plumpfull"
        pet1Text1.fontSize = 25
        addChild(pet1Text1)
        pet1Text1.isHidden = true
        
        pet1Text2 = SKLabelNode()
        pet1Text2.zPosition = 2
        pet1Text2.position = CGPoint(x: sBubble1.position.x, y: sBubble1.position.y + (sBubble1.position.y * -0.1))
        pet1Text2.fontColor = UIColor.black
        pet1Text2.fontName = "Plumpfull"
        pet1Text2.fontSize = 25
        addChild(pet1Text2)
        pet1Text2.isHidden = true
        
        picFrame = SKShapeNode(rectOf: CGSize(width: self.frame.size.width * 0.2, height: self.frame.size.width * 0.2))
        picFrame.xScale = 2.2
        picFrame.yScale = 2.2
        picFrame.fillColor = UIColor.white
        picFrame.strokeColor = UIColor.brown
        picFrame.lineWidth = 6.0
        picFrame.zPosition = 0.5
        picFrame.position = CGPoint(x: self.frame.size.width * -0.21, y: self.frame.size.height * -0.02)
        addChild(picFrame)
        
        frameText1 = SKLabelNode()
        frameText1.zPosition = 2
        frameText1.position = CGPoint(x: self.frame.size.width * -0.3298, y: self.frame.size.height * 0.0239)
        frameText1.fontColor = UIColor.black
        frameText1.fontName = "Plumpfull"
        frameText1.fontSize = 50
        frameText1.text = "🐶"
        addChild(frameText1)
        //frameText1.isHidden = true
        
        frameText2 = SKLabelNode()
        frameText2.zPosition = 2
        frameText2.position = CGPoint(x: self.frame.size.width * -0.2098, y: self.frame.size.height * 0.0239)
        frameText2.fontColor = UIColor.black
        frameText2.fontName = "Plumpfull"
        frameText2.fontSize = 50
        frameText2.text = "🐶"
        addChild(frameText2)
        //frameText2.isHidden = true
        
        frameText3 = SKLabelNode()
        frameText3.zPosition = 2
        frameText3.position = CGPoint(x: self.frame.size.width * -0.08986, y: self.frame.size.height * 0.0239)
        frameText3.fontColor = UIColor.black
        frameText3.fontName = "Plumpfull"
        frameText3.fontSize = 50
        frameText3.text = "🐶"
        addChild(frameText3)
        //frameText3.isHidden = true
        
        frameText4 = SKLabelNode()
        frameText4.zPosition = 2
        frameText4.position = CGPoint(x: self.frame.size.width * -0.3298, y: self.frame.size.height * -0.0434)
        frameText4.fontColor = UIColor.black
        frameText4.fontName = "Plumpfull"
        frameText4.fontSize = 50
        frameText4.text = "🐶"
        addChild(frameText4)
        //frameText4.isHidden = true
        
        frameText5 = SKLabelNode()
        frameText5.zPosition = 2
        frameText5.position = CGPoint(x: self.frame.size.width * -0.2098, y: self.frame.size.height * -0.0434)
        frameText5.fontColor = UIColor.black
        frameText5.fontName = "Plumpfull"
        frameText5.fontSize = 50
        frameText5.text = "🐶"
        addChild(frameText5)
        //frameText5.isHidden = true
        
        frameText6 = SKLabelNode()
        frameText6.zPosition = 2
        frameText6.position = CGPoint(x: self.frame.size.width * -0.08986, y: self.frame.size.height * -0.0434)
        frameText6.fontColor = UIColor.black
        frameText6.fontName = "Plumpfull"
        frameText6.fontSize = 50
        frameText6.text = "🐶"
        addChild(frameText6)
        //frameText6.isHidden = true
        
        frameText7 = SKLabelNode()
        frameText7.zPosition = 2
        frameText7.position = CGPoint(x: self.frame.size.width * -0.3298, y: self.frame.size.height * -0.1109)
        frameText7.fontColor = UIColor.black
        frameText7.fontName = "Plumpfull"
        frameText7.fontSize = 50
        frameText7.text = "🐶"
        addChild(frameText7)
        //frameText7.isHidden = true
        
        frameText8 = SKLabelNode()
        frameText8.zPosition = 2
        frameText8.position = CGPoint(x: self.frame.size.width * -0.2098, y: self.frame.size.height * -0.1109)
        frameText8.fontColor = UIColor.black
        frameText8.fontName = "Plumpfull"
        frameText8.fontSize = 50
        frameText8.text = "🐶"
        addChild(frameText8)
        //frameText8.isHidden = true
        
        frameText9 = SKLabelNode()
        frameText9.zPosition = 2
        frameText9.position = CGPoint(x: self.frame.size.width * -0.08986, y: self.frame.size.height * -0.1109)
        frameText9.fontColor = UIColor.black
        frameText9.fontName = "Plumpfull"
        frameText9.fontSize = 50
        frameText9.text = "🐶"
        addChild(frameText9)
        //frameText9.isHidden = true
        
        frameText = [frameText1, frameText2, frameText3, frameText4, frameText5, frameText6, frameText7, frameText8, frameText9]
        
        headerText = SKLabelNode()
        headerText.zPosition = 1.0
        // .16 .44
        headerText.position = CGPoint(x: 0, y: self.frame.size.height * 0.35)
        headerText.fontName = "Plumpfull"
        headerText.fontSize = 30
        headerText.fontColor = UIColor.white
        headerText.text = ""
        addChild(headerText)
        
        pointer = SKSpriteNode(imageNamed: "arrowicon")
        pointer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        pointer.size = CGSize(width: self.frame.size.width * 0.15, height: self.frame.size.height * 0.056)
        pointer.xScale = -1
        pointer.zPosition = 1.0
        pointer.position = CGPoint(x: self.frame.size.width * -0.25, y: self.frame.size.height * -0.39)
        pointer.color = UIColor.white
        pointer.colorBlendFactor = 1.0
        addChild(pointer)
        pointer.isHidden = true
        
        array = [entranceAnimation, math1, math2, math3, ask1, ask2, bigNumber, goodbye1, reentrance, people1, people2, goodbye2]
        correctAnswers = ["hello", "one", "two", "five", "how many cars do you have", "how many books do you have", "one thousand", "goodbye", "hello", "eight", "three", "goodbye"]
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
        Pet1.run(walkIn)
        
        Timer.scheduledTimer(withTimeInterval: 4, repeats: false) {
            timer in
            
            self.sBubble1.isHidden = false
            self.pet1Text1.text = "Hello!"
            self.pet1Text2.text = ""
            self.pet1Text1.isHidden = false
            self.pet1Text2.isHidden = false
            
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) {
                timer in
                
                //self.talkButton.isHidden = false
                
            }
        }
        
    }
    
    func math1() {
        //talkButton.isHidden = true
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
                    
                    //self.talkButton.isHidden = false
                }
            }
            
        }
        
    }
    
    func math2() {
        //talkButton.isHidden = true
        
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
                    
                    //self.talkButton.isHidden = false
                }
            }
            
        }

    }
    
    func math3() {
        //talkButton.isHidden = true
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
                    
                    //self.talkButton.isHidden = false
                }
            }
            
        }
    
    }
    
    func ask1() {
        //talkButton.isHidden = true
        
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
                    
                    //self.talkButton.isHidden = false
                }
            }
        }
        
    }
    
    func ask2() {
        //talkButton.isHidden = true
        
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
                    
                    //self.talkButton.isHidden = false
                }
            }
        }

    }
    
    func bigNumber() {
        //talkButton.isHidden = true
        
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
                    
                    //self.talkButton.isHidden = false
                }
        }
    }
    
    func goodbye1() {
        //talkButton.isHidden = true
        
        pet1Text1.text = ""
        pet1Text2.text = ""
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {
            timer in
            
            self.pet1Text1.text = "Thank you."
            self.pet1Text2.text = "Goodbye!"
            
            Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                timer in
                
                //self.talkButton.isHidden = false
            }
        }
    }
    
    func reentrance() {
        //talkButton.isHidden = true
        
        Pet1.run(walkOut)
        pet1Text1.text = ""
        pet1Text2.text = ""
        sBubble1.isHidden = true
        
        
        
        Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) {
            timer in
            
            self.Pet1.position = CGPoint(x: self.frame.size.width, y: self.frame.size.height * -0.388)
            self.Pet1.color = UIColor.blue
            self.Pet1.colorBlendFactor = 0.5
            self.Pet1.run(self.walkIn)
            
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) {
                timer in
                self.sBubble1.isHidden = false
                self.pet1Text1.text = "Hello!"
                
                Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                    timer in
                    
                    //self.talkButton.isHidden = false
                }
            }
        }
    }
    
    func people1() {
        //talkButton.isHidden = true
        
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
                
                //self.talkButton.isHidden = false
            }
        }
        
    }
    
    func people2() {
        //talkButton.isHidden = true
        
        pet1Text1.text = ""
        pet1Text2.text = ""
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) {
            timer in
            
            self.pet1Text1.text = "How many people"
            self.pet1Text2.text = "are running?"
            
            Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) {
                timer in
                
                //self.talkButton.isHidden = false
            }
        }
    }
    
    func goodbye2() {
        //talkButton.isHidden = true
        
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
                
                //self.talkButton.isHidden = false
            }
        }
    }

    
    func pushToScene(scene: SKScene, direction: SKTransitionDirection) {
        let sceneTransition = SKTransition.push(with: direction, duration: 0.5)
        scene.scaleMode = .aspectFill
        self.view?.presentScene(scene, transition: sceneTransition)
    }
    
    func checkAnswer(answer: String) {
        if (answer.lowercased() == correctAnswers[counter].lowercased()) {
            nextPrompt()
        }
    }
    
    func nextPrompt() {
        counter += 1
        if counter < array.count {
            self.array[counter]()
            self.pointer.isHidden = true
        }
    }
    
}


