//
//  LearnPage.swift
//  Digipet
//
//  Created by Katie Katz on 11/6/17.
//  Copyright © 2017 Katie Katz. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class LearnPage: SKScene {
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    
    var backArrow: SKSpriteNode!
    let homePage = SKScene(fileNamed: "GameScene")
    
    
    override func didMove(to view: SKView) {
        //back arrow
        backArrow = childNode(withName: "//backArrow") as! SKSpriteNode
        //imageView = UIImageView(image: UIImage(named: "image.png"))
        
//        scrollView = UIScrollView(frame: view.bounds)
//        scrollView.backgroundColor = UIColor.red
//        //scrollView.contentSize = imageView.bounds.size
//        scrollView.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.RawValue(UInt8(UIViewAutoresizing.flexibleWidth.rawValue) | UInt8(UIViewAutoresizing.flexibleHeight.rawValue)))
//        
//        scrollView.setContentOffset(CGPoint(x: 100, y: -50), animated: true)
//        //scrollView.addSubview(imageView)
//        view.addSubview(scrollView)
    }
    
    func goToScene(scene: SKScene) {
        let sceneTransition = SKTransition.fade(with: UIColor.darkGray, duration: 1)
        scene.scaleMode = .aspectFill
        self.view?.presentScene(scene, transition: sceneTransition)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let touchLocation = touch.location(in: self)
        
        if backArrow.contains(touchLocation) {
            let transition:SKTransition = SKTransition.fade(with: UIColor.darkGray, duration: 1)
            let scene:SKScene = homePage!
            self.view?.presentScene(scene, transition: transition)
        }
        
    }
}
