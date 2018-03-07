//
//  Lesson.swift
//  Digipet
//
//  Created by Katie Katz on 3/6/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import UIKit

class Lesson {
    
    var name : String
    var petImg : String
    var fileDest : String
    
    init?(name: String, petImg : String, fileDest : String){
        
        guard !name.isEmpty else {
            return nil
        }
        guard !petImg.isEmpty else {
            return nil
        }
        guard !fileDest.isEmpty else {
            return nil
        }
        
        self.name = name
        self.petImg = petImg
        self.fileDest = fileDest
    }
    
}
