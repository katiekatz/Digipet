//
//  LessonStart.swift
//  Digipet
//
//  Created by Katie Katz on 3/7/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import UIKit

class LessonStart : UIViewController {
    
    var level : String = "0"
    var lesson : Lesson?
    
    @IBOutlet weak var startBox: UIView!
    @IBOutlet weak var petImg: UIImageView!
    @IBOutlet weak var lessonName: UILabel!
    @IBOutlet weak var lessonDesc: UILabel!
    @IBOutlet weak var talkButton: LessonButton!
    @IBOutlet weak var typeButton: LessonButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ask emma for colors
        switch level {
        case "1":
            view.backgroundColor = UIColor(red: 159/255.0, green: 1, blue: 159/255.0, alpha: 1)
        case "2":
            view.backgroundColor = UIColor(red: 252/255.0, green: 138/255.0, blue: 1, alpha: 1)
        case "3":
            view.backgroundColor = UIColor(red: 249/255.0, green: 189/255.0, blue: 83/255.0, alpha: 1)
        case "4":
            view.backgroundColor = UIColor(red: 234/255.0, green: 108/255.0, blue: 169/255.0, alpha: 1)
        case "5":
            view.backgroundColor = UIColor(red: 148/255.0, green: 250/255.0, blue: 1, alpha: 1)
        case "6":
            view.backgroundColor = UIColor(red: 247/255.0, green: 229/255.0, blue: 99/255.0, alpha: 1)
        default:
            view.backgroundColor = .white
        }
        
        startBox.layer.borderColor = UIColor.black.cgColor
        startBox.layer.borderWidth = 3
        startBox.layer.cornerRadius = 10
        
        petImg.image = UIImage(named: (lesson?.petImg)!)
        
        lessonName.text = lesson?.name.uppercased()
        lessonDesc.text = lesson?.startDesc
        
        talkButton.layer.borderColor = UIColor(red: 108/255.0, green: 1, blue: 111/255.0, alpha: 1).cgColor
        talkButton.layer.cornerRadius = 14
        talkButton.layer.masksToBounds = true
        talkButton.layer.borderWidth = 2
        talkButton.layer.backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1).cgColor
        
        typeButton.layer.borderColor = UIColor(red: 1, green: 0, blue: 1, alpha: 1).cgColor
        typeButton.layer.cornerRadius = 14
        typeButton.layer.masksToBounds = true
        typeButton.layer.borderWidth = 2
        typeButton.layer.backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1).cgColor
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? LevelVC {
            vc.text = level
        }
    }
    
}
