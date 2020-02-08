//
//  ViewController.swift
//  Member Matcher
//
//  Created by Olivia Li on 2020-02-05.
//  Copyright © 2020 Olivia Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        logo.image = UIImage(named:"mdb_logo.png")
        btn.layer.cornerRadius = 30
        btn.layer.borderWidth = 1
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.modalPresentationStyle = .fullScreen
    }
    



}

