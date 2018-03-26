//
//  NewL1LessonOne.swift
//  Digipet
//
//  Created by Nicholas Kassoy on 3/13/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import Foundation
import UIKit

class NewL1LessonOne : UIViewController {
    
    let lesson = Lesson(name: "Basics I", petImg: "china", fileDest: "toL1LessonOne", infoVH: "hello, goodbye, yes, no, maybe, okay, please, thank you, you're welcome, good morning...", infoGD: "game desc dnwse fjswie nvweih dhfwseh jd j jwieuuwa ab abaw erfwarf awefaw svawraf aewjn", startDesc: "think and thonk and thunk and think and thonk and thunk and think and thonk and thunk and uwu and hello and is this thing on")!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var talkButton: UIButton!
    @IBOutlet weak var myTest: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //self.searchBar.endEditing(true)
    }
    
    
    @IBAction func printMessage() {
        var myString: String = myTest.text
        print(myString)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? LessonStart {
            vc.level = "1"
            vc.lesson = lesson
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
