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
        logo.image = UIImage(named:"mdb_logo.png")!
        btn.layer.cornerRadius = 25
        btn.layer.borderWidth = 3
        btn.layer.borderColor = UIColor(red: 102/255, green: 190/255, blue: 237/255, alpha: 1.0).cgColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.modalPresentationStyle = .fullScreen
    }
    



}

