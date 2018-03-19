//
//  HighscoreTableViewController.swift
//  Trivia
//
//  Created by Philip van der Hoek on 17/03/2018.
//  Copyright © 2018 Philip van der Hoek. All rights reserved.
//

import UIKit
import FirebaseDatabase

class HighscoreTableViewController: UITableViewController {

    var highscores = [Score]()
    var highscoresList = [Score]()
    
    var refHighscore: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refHighscore = Database.database().reference().child("trivia-6dbe5")

        refHighscore.observe(DataEventType.value, with: { (snapshot) in
            
            // If the reference have some values
            if snapshot.childrenCount > 0 {
                
                // Clearing the list
                self.highscores.removeAll()
                
                // Iterating through all the values
                for player in snapshot.children.allObjects as! [DataSnapshot] {
                    // Getting values
                    let playerObject = player.value as? [String: AnyObject]
                    let playerName  = playerObject?["playerName"]
                    let playerScore  = playerObject?["playerScore"]
                    
                    //Creating player object with model and fetched values
                    let highscore = Score(player: (playerName as! String?)!, points: (playerScore as! Int?)!)
                    
                    // Appending it to list
                    self.highscores.append(highscore)
                }
                
                self.tableView.reloadData()
            }
        })
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return highscores.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "highscoreIdentifier", for: indexPath)
        configure(cell: cell, forItemAt: indexPath)
        return cell
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let highscore = highscores[indexPath.row]
        cell.textLabel?.text = highscore.player
        cell.detailTextLabel?.text = String(highscore.points)
    }

}
