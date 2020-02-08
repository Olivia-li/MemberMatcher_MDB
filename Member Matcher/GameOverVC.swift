//
//  GameOverVC.swift
//  Member Matcher
//
//  Created by Olivia Li on 2020-02-07.
//  Copyright © 2020 Olivia Li. All rights reserved.
//

import UIKit

class GameOverVC: UIViewController {

    @IBOutlet weak var final: UILabel!
    var score:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        final.text = "Your score is " + String(score) + "/20"

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.modalPresentationStyle = .fullScreen
    }

}
