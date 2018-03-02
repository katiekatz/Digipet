//
//  Learn.swift
//  Digipet
//
//  Created by Katie Katz on 3/1/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import Foundation
import UIKit

class Learn : UIViewController {
    
    
    @IBOutlet weak var backArrow: UIButton!
    @IBOutlet weak var level1: UILabel!
    @IBOutlet weak var level2: UILabel!
    @IBOutlet weak var level3: UILabel!
    @IBOutlet weak var level4: UILabel!
    @IBOutlet weak var level5: UILabel!
    @IBOutlet weak var level6: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        level1.layer.borderColor = UIColor.black.cgColor
        level1.layer.borderWidth = 2
        level2.layer.borderColor = UIColor.black.cgColor
        level2.layer.borderWidth = 2
        level3.layer.borderColor = UIColor.black.cgColor
        level3.layer.borderWidth = 2
        level4.layer.borderColor = UIColor.black.cgColor
        level4.layer.borderWidth = 2
        level5.layer.borderColor = UIColor.black.cgColor
        level5.layer.borderWidth = 2
        level6.layer.borderColor = UIColor.black.cgColor
        level6.layer.borderWidth = 2
        
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
