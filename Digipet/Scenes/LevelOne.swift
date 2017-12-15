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

    
    override func didMove(to view: SKView) {
        //background box for scrolling
        let whiteBox = SKSpriteNode(color: .white, size: CGSize(width: 750, height: 350))
        whiteBox.position = CGPoint(x: 375, y: 1169)
        whiteBox.zPosition = 0;
        addChild(whiteBox);
        
        
        
        //scroll stuff
        addChild(moveableNode)
        scrollView = SwiftySKScrollView(frame: CGRect(x: 0, y: 0, width: size.width, height: 1334), moveableNode: moveableNode, direction: .vertical)
        
        scrollView?.contentSize = CGSize(width: scrollView!.frame.width, height: scrollView!.frame.height * 3) // makes it 3 times the height
    

        //this was supposed to be view? but that threw an error so we're trying this
        view.addSubview(scrollView!)
        
        guard let scrollView = scrollView else { return } // unwrap  optional
        
        let page1ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: scrollView.frame.width, height: scrollView.frame.size.height))
        page1ScrollView.position = CGPoint(x: frame.midX, y: frame.midY)
        page1ScrollView.zPosition = -1;
        moveableNode.addChild(page1ScrollView)
        
        let page2ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: scrollView.frame.width, height: scrollView.frame.size.height))
        page2ScrollView.position = CGPoint(x: frame.midX, y: frame.midY - scrollView.frame.height)
        page2ScrollView.zPosition = -1;
        moveableNode.addChild(page2ScrollView)
        
        let page3ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: scrollView.frame.width, height: scrollView.frame.size.height))
        page3ScrollView.position = CGPoint(x: frame.midX, y: frame.midY - (scrollView.frame.height * 2))
        page3ScrollView.zPosition = -1;
        moveableNode.addChild(page3ScrollView)
        
        //test nodes for scroll
        let sprite1Page1 = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        sprite1Page1.position = CGPoint(x: 0, y: 0)
        page1ScrollView.addChild(sprite1Page1)
        
        let sprite2Page1 = SKSpriteNode(color: .orange, size: CGSize(width: 50, height: 50))
        sprite2Page1.position = CGPoint(x: sprite1Page1.position.x, y: sprite1Page1.position.y - sprite2Page1.size.height * 1.5)
        sprite1Page1.addChild(sprite2Page1)
        
        //REAL STUFF ON PAGE 1
        let row1Page1 = SKSpriteNode(color: .blue, size: CGSize(width: page1ScrollView.size.width, height: 246))
        row1Page1.anchorPoint.y = 0;
        row1Page1.position = CGPoint(x: 0, y: -667)
        page1ScrollView.addChild(row1Page1)
        
        let row2Page1 = SKSpriteNode(color: .purple, size: CGSize(width: page1ScrollView.size.width, height: 246))
        row2Page1.anchorPoint.y = 0;
        row2Page1.position = CGPoint(x: 0, y: -421)
        page1ScrollView.addChild(row2Page1)
        
        let row3Page1 = SKSpriteNode(color: .magenta, size: CGSize(width: page1ScrollView.size.width, height: 246))
        row3Page1.anchorPoint.y = 0;
        row3Page1.position = CGPoint(x: 0, y: -175)
        page1ScrollView.addChild(row3Page1)
        
        let row4Page1 = SKSpriteNode(color: .blue, size: CGSize(width: page1ScrollView.size.width, height: 246))
        row4Page1.anchorPoint.y = 0;
        row4Page1.position = CGPoint(x: 0, y: 71)
        page1ScrollView.addChild(row4Page1)
        
        /// Test sprites page 2
        let sprite1Page2 = SKSpriteNode(color: .yellow, size: CGSize(width: 50, height: 50))
        sprite1Page2.position = CGPoint(x: 0, y: 0)
        page2ScrollView.addChild(sprite1Page2)
        
        let sprite2Page2 = SKSpriteNode(color: .green, size: CGSize(width: 50, height: 50))
        sprite2Page2.position = CGPoint(x: sprite1Page2.position.x, y: sprite1Page2.position.y - (sprite2Page2.size.height * 1.5))
        sprite1Page2.addChild(sprite2Page2)
        
        /// Test sprites page 3
        let sprite1Page3 = SKSpriteNode(color: .blue, size: CGSize(width: 50, height: 50))
        sprite1Page3.position = CGPoint(x: 0, y: 0)
        page3ScrollView.addChild(sprite1Page3)
        
        let sprite2Page3 = SKSpriteNode(color: .purple, size: CGSize(width: 50, height: 50))
        sprite2Page3.position = CGPoint(x: sprite1Page3.position.x, y: sprite1Page3.position.y - (sprite2Page3.size.height * 1.5))
        sprite1Page3.addChild(sprite2Page3)
        //end scroll stuff
        
        
        backArrow = childNode(withName: "//backArrow") as! SKSpriteNode
        menuIcon = childNode(withName: "//menuIcon") as! SKSpriteNode
        lessonsText = childNode(withName: "//lessonsText") as! SKLabelNode
        levelText = childNode(withName: "//levelText") as! SKLabelNode
        oneText = childNode(withName: "//oneText") as! SKLabelNode
        backArrow.position = CGPoint(x: 92, y: 1267)
        backArrow.zPosition = 1;
        menuIcon.position = CGPoint(x: 658, y: 1267)
        menuIcon.zPosition = 1;
        lessonsText.position = CGPoint(x: 375, y: 1034)
        lessonsText.zPosition = 1;
        levelText.position = CGPoint(x: 350, y: 1134)
        levelText.zPosition = 1;
        oneText.position = CGPoint(x: 525, y: 1134)
        oneText.zPosition = 1;
        
    }
    
    func pushToScene(scene: SKScene, direction: SKTransitionDirection) {
        let sceneTransition = SKTransition.push(with: direction, duration: 0.5)
        scene.scaleMode = .aspectFill
        self.view?.presentScene(scene, transition: sceneTransition)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let touchLocation = touch.location(in: self)
        
        if backArrow.contains(touchLocation) {
            let scene:SKScene = SKScene(fileNamed: "LearnPage")!
            pushToScene(scene: scene, direction: .right)
        }
    
        
    }
    
    override func willMove(from view: SKView) {
        scrollView?.removeFromSuperview()
        scrollView = nil // nil out reference to deallocate properly
    }
    
}
