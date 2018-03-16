//
//  LessonTableViewController.swift
//  Digipet
//
//  Created by Katie Katz on 3/6/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import UIKit

class LessonTableViewController : UITableViewController {
    
    var lessonNumber : String = "0"
    var lessonList = [Lesson]()
    var color : CGColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        tableView.alwaysBounceVertical = false
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessonList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "LessonTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? LessonTableViewCell  else {
            fatalError("The dequeued cell is not an instance of LessonTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let lesson = lessonList[indexPath.row]
        
        cell.lessonName.text = lesson.name
        cell.petImg.image = UIImage(named: lesson.petImg)
        cell.startButton.lesson = lesson
        cell.startButton.layer.borderColor = color
        return cell
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? LevelVC {
            let ib = sender as! LessonButton
            vc.lessonFocus = ib.lesson
            vc.text = lessonNumber
            vc.showInfo = "yes"
        }
    }

    
}
