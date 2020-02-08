//
//  GameVC.swift
//  Member Matcher
//
//  Created by Olivia Li on 2020-02-05.
//  Copyright © 2020 Olivia Li. All rights reserved.
//

import UIKit

class GameVC: UIViewController {
    // Name Buttons
    @IBOutlet weak var Name1: UIButton!
    @IBOutlet weak var Name2: UIButton!
    @IBOutlet weak var Name3: UIButton!
    @IBOutlet weak var Name4: UIButton!
    @IBOutlet weak var Score: UILabel!
    @IBOutlet weak var TimeOut: UILabel!
    @IBOutlet weak var play: UIButton!
    
    // Picture View
    @IBOutlet weak var Picture: UIImageView!
    
    let shuffledNames = Constants.names.shuffled()
    var curr:Int = 0
    var count:Int = 0
    var streak:Int = 0
    
    // variables for statistics
    var longestStreak:Int = 0
    var firstName = "None"
    var secondName = "None"
    var thirdName = "None"
    var firstresult = "n/a"
    var secondresult = "n/a"
    var thirdresult = "n/a"
    
    var nameA: String = "a"
    var nameB: String = "b"
    var nameC: String = "c"
    var nameD: String = "d"
    var timer: Timer?
    
    var on = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        on = true
        play.setTitle("Pause", for: .normal)
        TimeOut.text = "5 seconds left"
        displayPicture()
        displayNames()
        getScore()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func playPause(_ sender: Any) {
        if on{
            play.setTitle("Play", for: .normal)
            on = !on
            timer?.invalidate()
        }
        else{
            play.setTitle("Pause", for: .normal)
            on = !on
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        }
    }
    
    var seconds = 0
    @objc func fireTimer() {
        if seconds<5 {
            seconds+=1
            TimeOut.text = String(5-seconds) + " seconds left"
        }
        else{
            TimeOut.text = "Time's out!!!"
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.reset()
            }
        }
    }
    
    func reset(){
        if curr < 20{
            seconds = 0
            timer?.invalidate()
            curr+=1
            TimeOut.text = "5 seconds left"
            seconds = 0
            Name1.backgroundColor = UIColor.clear
            Name2.backgroundColor = UIColor.clear
            Name3.backgroundColor = UIColor.clear
            Name4.backgroundColor = UIColor.clear
            displayNames()
            displayPicture()
            getScore()
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        }
        else{
            performSegue(withIdentifier: "gameOver", sender: nil)
            curr = 0
        }
    }
    
    func getScore(){
        Score.text = "Score: " + String(count)
    }
    
    @IBAction func onClick1(_ sender: UIButton) {
        results(Name1)
    }
    
    @IBAction func onClick2(_ sender: UIButton) {
        results(Name2)
    }
    
    @IBAction func onClick3(_ sender: UIButton) {
        results(Name3)
    }
    @IBAction func onClick4(_ sender: UIButton) {
        results(Name4)
    }
    
    func results(_ btn: UIButton){
        if btn.currentTitle == shuffledNames[curr]{
            count+=1
            correctAnswer(btn)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.reset()
            }
        }
        else{
            wrongAnswer(btn)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.reset()
            }
        }
    }
    
    /*
     Returns randomized name list without current picture name
     */
    func getNames() -> [String]{
            let tempList:[String] = Array(shuffledNames[..<curr] +  shuffledNames[curr+1..<shuffledNames.count]).shuffled()
            return Array(tempList[0...2]) + [shuffledNames[curr]]
    }
    
    /*
     Displays the picture of current name
     */
    func displayPicture(){
        Picture.image = Constants.getImageFor(name: shuffledNames[curr])
    }
    
    /*
     Displays names with one correct name and 3 random options
     */
    func displayNames(){
        let temp:[String] = getNames().shuffled()
        Name1.setTitle(temp[0], for: .normal)
        nameA = temp[0]
        Name2.setTitle(temp[1], for: .normal)
        nameB = temp[1]
        Name3.setTitle(temp[2], for: .normal)
        nameC = temp[2]
        Name4.setTitle(temp[3], for: .normal)
        nameD = temp[3]
    }
    
    func correctAnswer(_ btn: UIButton){
        btn.backgroundColor = UIColor.green
        streak += 1
        if streak > longestStreak{
            longestStreak = streak
        }
        thirdName = secondName
        secondName = firstName
        firstName = shuffledNames[curr]
        thirdresult = secondresult
        secondresult = firstresult
        firstresult = "Correct"
    }
    
    func wrongAnswer(_ btn: UIButton){
        btn.backgroundColor = UIColor.red
        streak = 0
        thirdName = secondName
        secondName = firstName
        firstName = shuffledNames[curr]
        thirdresult = secondresult
        secondresult = firstresult
        firstresult = "Wrong"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "home" {
            segue.destination.modalPresentationStyle = .fullScreen
    }
        else if segue.identifier == "gameOver"{
            segue.destination.modalPresentationStyle = .fullScreen
            if let over = segue.destination as? GameOverVC, segue.identifier == "gameOver" {
                over.score = count
        }
        }
        else{
            if let vc = segue.destination as? StatsVC, segue.identifier == "statsboard" {
                timer?.invalidate()
                play.setTitle("Play", for: .normal)
                on = false                
                vc.longestStreak = longestStreak
                vc.firstName = firstName
                vc.secondName = secondName
                vc.thirdName = thirdName
                vc.firstresult = firstresult
                vc.secondresult = secondresult
                vc.thirdresult = thirdresult
        }

    }
}
}
    
