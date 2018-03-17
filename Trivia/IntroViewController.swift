//
//  ViewController.swift
//  Trivia
//
//  Created by Philip van der Hoek on 14/03/2018.
//  Copyright © 2018 Philip van der Hoek. All rights reserved.
//

import UIKit
import Firebase


class IntroViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var startGameButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = ""
        updateStartButtonState()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func updateStartButtonState() {
        let name = nameTextField.text!
        startGameButton.isEnabled = !name.isEmpty
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameStarted" {
            let name = nameTextField.text!
            let navigationController = segue.destination as!
            UINavigationController
            let questionViewController = navigationController.childViewControllers.first as!
                QuestionViewController
            questionViewController.name = name
        }
    }
    
    @IBAction func nameEdited(_ sender: UITextField) {
        updateStartButtonState()
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        nameTextField.resignFirstResponder()
    }
    
    @IBAction func unwindToIntro(segue:
        UIStoryboardSegue) {
        // Restarts the quiz
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

