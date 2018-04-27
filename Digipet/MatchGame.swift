//
//  MatchGame.swift
//  Digipet
//
//  Created by Timothy Obiso on 3/28/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import UIKit

class MatchGame: UIViewController {
    var randomHalf = (1...8).map{_ in Int(arc4random_uniform(5))}
    var random: [Int] = []
    var flipped: Int = 0
    var flippedNum: Int = -1
    var matched: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    var currentCard: Int = -1
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    @IBOutlet weak var button13: UIButton!
    @IBOutlet weak var button14: UIButton!
    @IBOutlet weak var button15: UIButton!
    @IBOutlet weak var button16: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(random)
        random = randomHalf + randomHalf
        random.shuffle()
        var buttons: [UIButton] = [button1, button2, button3, button4, button5, button6, button7, button8, button9, button10, button11, button12, button13, button14, button15, button16]
        label.text = ""
        
    }
    override var shouldAutorotate: Bool {
        return true
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print(flipped)
    }
    @IBAction func button1(_ sender: Any) {
        cardTouch(num: 0)
    }
    @IBAction func button2(_ sender: Any) {
        cardTouch(num: 1)
    }
    @IBAction func button3(_ sender: Any) {
        cardTouch(num: 2)
    }
    @IBAction func button4(_ sender: Any) {
        cardTouch(num: 3)
    }
    @IBAction func button5(_ sender: Any) {
        cardTouch(num: 4)
    }
    @IBAction func button6(_ sender: Any) {
        cardTouch(num: 5)
    }
    @IBAction func button7(_ sender: Any) {
        cardTouch(num: 6)
    }
    @IBAction func button8(_ sender: Any) {
        cardTouch(num: 7)
    }
    @IBAction func button9(_ sender: Any) {
        cardTouch(num: 8)
    }
    @IBAction func button10(_ sender: Any) {
        cardTouch(num: 9)
    }
    
    @IBAction func button11(_ sender: Any) {
        cardTouch(num: 10)
    }
    @IBAction func button12(_ sender: Any) {
        cardTouch(num: 11)
    }
    @IBAction func button13(_ sender: Any) {
        cardTouch(num: 12)
    }
    @IBAction func button14(_ sender: Any) {
        cardTouch(num: 13)
    }
    @IBAction func button15(_ sender: Any) {
        cardTouch(num: 14)
    }
    @IBAction func button16(_ sender: Any) {
        cardTouch(num: 15)
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
    
    func cardFlip(card: Int) -> UIImage {
        if card == 0 {
            return #imageLiteral(resourceName: "apple")
        } else if card == 1 {
            return #imageLiteral(resourceName: "man")
        } else if card == 2 {
            return #imageLiteral(resourceName: "woman")
        } else if card == 3 {
            return #imageLiteral(resourceName: "dog")
        } else {
            return #imageLiteral(resourceName: "cat")
        }
            
    }
    func cardTouch(num: Int) {
        let buttons = [button1, button2, button3, button4, button5, button6, button7, button8, button9, button10, button11, button12, button13, button14, button15, button16]
        if flipped >= 2 {
            label.text = ""
            flipAll()
            flipped = 0
            currentCard = -1
        } else if flipped == 1 && random[num] == flippedNum {
            label.text = "Match!"
            print("match")
            matched[currentCard] =  true
            print(flippedNum)
            matched[num] = true
            buttons[num]?.isEnabled = false
            buttons[currentCard]?.isEnabled = false
        } else if flipped == 0 {
            currentCard = num
        } else if flipped == 1 {
            label.text = "try again!"
        }
        flippedNum = random[num]
        currentCard = num
        (buttons[num] as! UIButton).setImage(cardFlip(card: random[num]), for: .normal)
        flipped+=1
    }
    
    func flipAll() {
        if !matched[0] {
            button1.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[1] {
            button2.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[2] {
            button3.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[3] {
            button4.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[4] {
            button5.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[5] {
            button6.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[6] {
            button7.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[7] {
            button8.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[8] {
            button9.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[9] {
            button10.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[10] {
            button11.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[11] {
            button12.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[12] {
            button13.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[13] {
            button14.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[14] {
            button15.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[15] {
            button16.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
    }
}

extension Array {
    /** Randomizes the order of an array's elements. */
    mutating func shuffle()
    {
        for _ in 0..<10
        {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}
