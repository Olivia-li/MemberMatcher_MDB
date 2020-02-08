//
//  StatsVC.swift
//  Member Matcher
//
//  Created by Olivia Li on 2020-02-05.
//  Copyright © 2020 Olivia Li. All rights reserved.
//

import UIKit

class StatsVC: UIViewController {

    @IBOutlet weak var longstreak: UILabel!
    
    @IBOutlet weak var first: UILabel!
    @IBOutlet weak var second: UILabel!
    @IBOutlet weak var third: UILabel!
    
    
    var longestStreak = 0
    var firstName = "None"
    var secondName = "None"
    var thirdName = "None"
    var firstresult = "n/a"
    var secondresult = "n/a"
    var thirdresult = "n/a"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        longstreak.text = "Longest Streak: " + String(longestStreak)
        first.text = firstName + ": " + firstresult
        second.text = secondName + ": " + secondresult
        third.text = thirdName + ": " + thirdresult
        // Do any additional setup after loading the view.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
