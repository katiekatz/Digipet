//
//  LessonTableViewCell.swift
//  Digipet
//
//  Created by Katie Katz on 3/6/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import UIKit

class StartButton : UIButton {
    var file : Lesson?
}

class LessonTableViewCell : UITableViewCell {
    @IBOutlet weak var lessonName: UILabel!
    @IBOutlet weak var petImg: UIImageView!
    @IBOutlet weak var startButton: StartButton!
    @IBOutlet weak var infoButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        
        startButton.layer.cornerRadius = 14
        startButton.layer.masksToBounds = true
        startButton.layer.borderColor = UIColor(red: 108/255.0, green: 1, blue: 111/255.0, alpha: 1).cgColor
        startButton.layer.borderWidth = 2
        startButton.layer.backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1).cgColor
        
        infoButton.layer.cornerRadius = 14
        infoButton.layer.masksToBounds = true
        infoButton.layer.borderColor = UIColor(red: 1, green: 0, blue: 1, alpha: 1).cgColor
        infoButton.layer.borderWidth = 2
        infoButton.layer.backgroundColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1).cgColor
        
        
    }


    
}
