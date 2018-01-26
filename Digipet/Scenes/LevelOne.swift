//
//  LevelOne.swift
//  Digipet
//
//  Created by Katie Katz on 11/17/17.
//  Copyright © 2017 Katie Katz. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class LevelOne: SKScene {
    
    //SwiftySKScrollView Attempt
    var scrollView: SwiftySKScrollView?
    let moveableNode = SKNode()
    //scroll done
    
    var backArrow: SKSpriteNode!
    var menuIcon: SKSpriteNode!
    var lessonsText: SKLabelNode!
    var levelText: SKLabelNode!
    var oneText: SKLabelNode!
    var startCover : SKShapeNode!
    var l1start : SKShapeNode!
    
    var row4Page1 : LessonRow!

    
    override func didMove(to view: SKView) {
        //background box for scrolling
        let whiteBox = SKSpriteNode(color: .white, size: CGSize(width: 750, height: 350))
        whiteBox.position = CGPoint(x: 375, y: 1169)
        whiteBox.zPosition = 10;
        addChild(whiteBox);
        
        
        
        //scroll stuff
        addChild(moveableNode)
        scrollView = SwiftySKScrollView(frame: CGRect(x: 0, y: 0, width: size.width, height: 1334), moveableNode: moveableNode, direction: .vertical)
        
        scrollView?.contentSize = CGSize(width: scrollView!.frame.width, height: scrollView!.frame.height + 2*984)
    

        //this was supposed to be view? but that threw an error so we're trying this
        view.addSubview(scrollView!)
        
        guard let scrollView = scrollView else { return } // unwrap  optional
        
        let page1ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: scrollView.frame.width, height: scrollView.frame.size.height))
        page1ScrollView.position = CGPoint(x: frame.midX, y: frame.midY)
        page1ScrollView.zPosition = -1
        moveableNode.addChild(page1ScrollView)
        
        let page2ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: scrollView.frame.width, height: 984))
        page2ScrollView.position = CGPoint(x: frame.midX, y: frame.midY - 1159)
        page2ScrollView.zPosition = -1
        moveableNode.addChild(page2ScrollView)
        
        let page3ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: scrollView.frame.width, height: 984))
        page3ScrollView.position = CGPoint(x: frame.midX, y: frame.midY - (984 + 1159))
        page3ScrollView.zPosition = -1
        moveableNode.addChild(page3ScrollView)
        
        
        //REAL STUFF ON PAGE 1
        let row1Page1 = LessonRow(size: CGSize(width: page1ScrollView.size.width, height: 246), y: -667, petName: "china", lN: "Lesson 4")
        page1ScrollView.addChild(row1Page1)
        

        let row2Page1 = LessonRow(size: CGSize(width: page1ScrollView.size.width, height: 246), y: -421, petName: "china", lN: "Lesson 3")
        page1ScrollView.addChild(row2Page1)
        
        let row3Page1 = LessonRow(size: CGSize(width: page1ScrollView.size.width, height: 246), y: -175, petName: "china", lN: "Lesson 2")
        page1ScrollView.addChild(row3Page1)
        
        row4Page1 = LessonRow(size: CGSize(width: page1ScrollView.size.width, height: 246), y: 71, petName: "china", lN: "Lesson 1")
        page1ScrollView.addChild(row4Page1)
        
        
        //REAL STUFF ON PAGE 2
        let row1Page2 = LessonRow(size: CGSize(width: page1ScrollView.size.width, height: 246), y: -492, petName: "china", lN: "Lesson 8")
        page2ScrollView.addChild(row1Page2)
        
        let row2Page2 = LessonRow(size: CGSize(width: page1ScrollView.size.width, height: 246), y: -246, petName: "china", lN: "Lesson 7")
        page2ScrollView.addChild(row2Page2)
        
        let row3Page2 = LessonRow(size: CGSize(width: page1ScrollView.size.width, height: 246), y: 0, petName: "china", lN: "Lesson 6")
        page2ScrollView.addChild(row3Page2)
        
        let row4Page2 = LessonRow(size: CGSize(width: page1ScrollView.size.width, height: 246), y: 246, petName: "china", lN: "Lesson 5")
        page2ScrollView.addChild(row4Page2)
        

        
        //REAL STUFF ON PAGE 3
        let row1Page3 = LessonRow(size: CGSize(width: page1ScrollView.size.width, height: 246), y: -492, petName: "china", lN: "Lesson 12")
        page3ScrollView.addChild(row1Page3)
        
        let row2Page3 = LessonRow(size: CGSize(width: page1ScrollView.size.width, height: 246), y: -246, petName: "china", lN: "Lesson 11")
        page3ScrollView.addChild(row2Page3)
        
        let row3Page3 = LessonRow(size: CGSize(width: page1ScrollView.size.width, height: 246), y: 0, petName: "china", lN: "Lesson 10")
        page3ScrollView.addChild(row3Page3)
        
        let row4Page3 = LessonRow(size: CGSize(width: page1ScrollView.size.width, height: 246), y: 246, petName: "china", lN: "Lesson 9")
        page3ScrollView.addChild(row4Page3)
        
        
        
        //end scroll stuff
        
        
        backArrow = childNode(withName: "//backArrow") as! SKSpriteNode
        menuIcon = childNode(withName: "//menuIcon") as! SKSpriteNode
        lessonsText = childNode(withName: "//lessonsText") as! SKLabelNode
        levelText = childNode(withName: "//levelText") as! SKLabelNode
        oneText = childNode(withName: "//oneText") as! SKLabelNode
        backArrow.position = CGPoint(x: 92, y: 1267)
        backArrow.zPosition = 11;
        menuIcon.position = CGPoint(x: 658, y: 1267)
        menuIcon.zPosition = 11;
        lessonsText.position = CGPoint(x: 375, y: 1034)
        lessonsText.zPosition = 11;
        levelText.position = CGPoint(x: 350, y: 1134)
        levelText.zPosition = 11;
        oneText.position = CGPoint(x: 525, y: 1134)
        oneText.zPosition = 11;
        
    }
    
    func pushToScene(scene: SKScene, direction: SKTransitionDirection) {
        let sceneTransition = SKTransition.push(with: direction, duration: 0.5)
        scene.scaleMode = .aspectFill
        self.view?.presentScene(scene, transition: sceneTransition)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let touchLocation = touch.location(in: self)
        
        let nodes = self.nodes(at: touchLocation)
        
        if backArrow.contains(touchLocation) {
            let scene:SKScene = SKScene(fileNamed: "LearnPage")!
            pushToScene(scene: scene, direction: .right)
        }
        
        if nodes.contains(row4Page1.startButton) {
            let scene:SKScene = SKScene(fileNamed: "StartLevelOneLessonOne")!
            pushToScene(scene: scene, direction: .left)
        }
    
        
        
    }
    
    override func willMove(from view: SKView) {
        scrollView?.removeFromSuperview()
        scrollView = nil // nil out reference to deallocate properly
    }
    
}
