//
//  ResultViewController.swift
//  Trivia
//
//  Created by Philip van der Hoek on 15/03/2018.
//  Copyright © 2018 Philip van der Hoek. All rights reserved.
//

import UIKit
import FirebaseDatabase


class ResultViewController: UIViewController {

    var score: Score!
    
    var refPlayer: DatabaseReference!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = score.player + " has " + String(score.points) + " points."
        // Do any additional setup after loading the view.
        
        refPlayer = Database.database().reference().child("trivia-6dbe5")
        addPlayer()
    }
    
    func addPlayer() {
        // Save players score to database
        let key = refPlayer.childByAutoId().key
        
        let highscore = ["id": key, "playerName": score.player, "playerScore": score.points] as [String : Any]
        
        refPlayer.child(key).setValue(highscore)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
