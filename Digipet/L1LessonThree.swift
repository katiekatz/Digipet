//
//  L1LessonThree.swift
//  Digipet
//
//  Created by Nicholas Kassoy on 5/2/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit
import Foundation

class L1LessonThree: SKScene {
    var Pet1: SKSpriteNode!
    var sBubble1: SKSpriteNode!
    var pet1Text1: SKLabelNode!
    var pet1Text2: SKLabelNode!
    var wall: SKSpriteNode!
    var pointer: SKSpriteNode!
    var fridgeClosed: SKSpriteNode!
    var fridgeOpen: SKSpriteNode!
    
    var headerText: SKLabelNode!
    
    var rotateAction: SKAction!
    var pointAction: SKAction!
    
    var array: [() -> ()] = []
    var correctAnswers: [String] = []
    var counter: Int = 0
    var animationRunning = false
    
    override func didMove(to view: SKView) {
        rotateAction = SKAction.sequence([SKAction.rotate(byAngle: 0.2, duration: 0.5), SKAction.rotate(byAngle: -0.2, duration: 0.5)])
        pointAction = SKAction.repeat((SKAction.sequence([SKAction.moveBy(x: -5, y: 0, duration: 0.5), SKAction.moveBy(x: 5, y: 0, duration: 0.5)])), count: 10)
        
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
        
        //        Pet2 = SKSpriteNode(imageNamed: "china")
        //        Pet2.size = CGSize(width: 375, height: 518)
        //        Pet2.color = UIColor.red
        //        Pet2.colorBlendFactor = 0.5
        //        Pet2.zPosition = 1.0
        //        Pet2.position = CGPoint(x: self.frame.size.width, y: self.frame.size.height * -0.388)
        //        addChild(Pet2)
        
        sBubble1 = SKSpriteNode(imageNamed: "speechbubble")
        sBubble1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        sBubble1.size = CGSize(width: self.frame.size.width * 0.75, height: self.frame.size.height * 0.25)
        sBubble1.zPosition = 1
        sBubble1.position = CGPoint(x: self.frame.size.width * 0.03, y: self.frame.size.height * 0.18)
        addChild(sBubble1)
        sBubble1.isHidden = true
        
        fridgeClosed = SKSpriteNode(imageNamed: "china")
        Pet1.size = CGSize(width: self.frame.size.width * 0.5, height: self.frame.size.height * 0.39)
        Pet1.zPosition = 1.0
        Pet1.position = CGPoint(x: self.frame.size.width, y: self.frame.size.height * -0.388)
        addChild(Pet1)
        
        pet1Text1 = SKLabelNode()
        pet1Text1.zPosition = 2
        pet1Text1.position = CGPoint(x: sBubble1.position.x, y: sBubble1.position.y + (sBubble1.position.y * 0.1))
        pet1Text1.fontColor = UIColor.black
        pet1Text1.fontName = "Plumpfull"
        pet1Text1.fontSize = 30
        addChild(pet1Text1)
        pet1Text1.isHidden = true
        
        pet1Text2 = SKLabelNode()
        pet1Text2.zPosition = 2
        pet1Text2.position = CGPoint(x: sBubble1.position.x, y: sBubble1.position.y + (sBubble1.position.y * -0.1))
        pet1Text2.fontColor = UIColor.black
        pet1Text2.fontName = "Plumpfull"
        pet1Text2.fontSize = 30
        addChild(pet1Text2)
        pet1Text2.isHidden = true
        
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
        
        array = []
        correctAnswers = ["hello", "goodbye", "hello"]
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
        let walkInAction: SKAction = SKAction.move(to: CGPoint(x: self.frame.size.width * 0.21, y: self.frame.size.height * -0.165), duration: 4)
        let walkIn: SKAction = SKAction.group([walkInAction, SKAction.repeat(rotateAction, count: 4)])
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
    
    
    func pushToScene(scene: SKScene, direction: SKTransitionDirection) {
        let sceneTransition = SKTransition.push(with: direction, duration: 0.5)
        scene.scaleMode = .aspectFill
        self.view?.presentScene(scene, transition: sceneTransition)
    }
    
    func checkAnswer(answer: String) {
        if (answer.lowercased() == correctAnswers[counter].lowercased()) {
            pet1Text1.text = "FJSDF"
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



