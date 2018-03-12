//
//  LevelVC.swift
//  Digipet
//
//  Created by Katie Katz on 3/2/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import Foundation
import UIKit

class LevelVC : UIViewController {
    
    var l1Lessons = [Lesson]()
    var l2Lessons = [Lesson]()
    var l3Lessons = [Lesson]()
    var l4Lessons = [Lesson]()
    var l5Lessons = [Lesson]()
    var l6Lessons = [Lesson]()
    
    let lesson1 = Lesson(name: "Caprese Salad", petImg: "china", fileDest: "ha")!
    let lesson2 = Lesson(name: "TeSt, how long is this", petImg: "china", fileDest: "ha")!
    let lesson3 = Lesson(name: "testing", petImg: "china", fileDest: "ha2")!
    let lesson4 = Lesson(name: "bwahaha", petImg: "china", fileDest: "ha")!
    let lesson5 = Lesson(name: "will this work?", petImg: "china", fileDest: "ha")!
    let lesson6 = Lesson(name: "abcxyz123", petImg: "china", fileDest: "ha")!
    let lesson7 = Lesson(name: "Nikki Blonsky", petImg: "china", fileDest: "ha")!

    
    let colorDef = UIColor(red: 127/255.0, green: 70/255.0, blue: 221/255.0, alpha: 1)
    let color1 = UIColor(red: 108/255.0, green: 1, blue: 111/255.0, alpha: 1)
    let color2 = UIColor(red: 1, green: 0, blue: 1, alpha: 1)
    let color3 = UIColor(red: 251/255.0, green: 174/255.0, blue: 23/255.0, alpha: 1)
    let color4 = UIColor(red: 237/255.0, green: 30/255.0, blue: 121/255.0, alpha: 1)
    let color5 = UIColor(red: 6/255.0, green: 232/255.0, blue: 1, alpha: 1)
    let color6 = UIColor(red: 252/255.0, green: 238/255.0, blue: 34/255.0, alpha: 1)
    
    var text:String = "0"
    var shouldTransition:String = "nil"
    var lessonStartDisplay : Lesson?
    var tableViewController : LessonTableViewController?
    
    @IBOutlet weak var lessonNumber: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        guard let tableController = childViewControllers.first as? LessonTableViewController else {
            fatalError("uh oh where'd the TVC go???")
        }
        
        tableViewController = tableController
        
        
        //lessons test code
        l1Lessons += [lesson1, lesson2, lesson3, lesson4, lesson5, lesson6]
        l2Lessons += [lesson7]
        
        lessonNumber?.text = text
        tableViewController!.lessonNumber = text
        switch text {
        case "1":
            lessonNumber?.textColor = color1
            tableViewController?.lessonList = l1Lessons
        case "2":
            lessonNumber?.textColor = color2
            tableViewController?.lessonList = l2Lessons
        case "3":
            lessonNumber?.textColor = color3
            tableViewController?.lessonList = l3Lessons
        case "4":
            lessonNumber?.textColor = color4
            tableViewController?.lessonList = l4Lessons
        case "5":
            lessonNumber?.textColor = color5
            tableViewController?.lessonList = l5Lessons
        case "6":
            lessonNumber?.textColor = color6
            tableViewController?.lessonList = l6Lessons
        default:
            fatalError("lesson clicked wasn't 1-6???")
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if shouldTransition == "lessonStart" {
            performSegue(withIdentifier: "LevelToLessonStart", sender: nil)
        }
    }

    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    
}
