//
//  ViewController.swift
//  True False Test
//
//  Created by Henry Aguinaga on 2016-11-29.
//  Copyright © 2016 Henry Aguinaga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblTitleOutlet: UILabel!
    @IBOutlet weak var lblQuestionOutlet: UILabel!
    
    @IBOutlet weak var btnTrueOutlet: UIButton!
    @IBOutlet weak var btnFalseOutlet: UIButton!
    @IBOutlet weak var lblScoreOutlet: UILabel!
    @IBOutlet weak var btnNewGameOutlet: UIButton!
    
    var listOfQuestions : [String] = []
    var listOfAnswers : [Bool] = []
    var hasBeenAnswered : [Bool] = []
    var currentQuestion : String?
    var currentAnswer : Bool?
    var score = 0
    var randomNumber : Int?
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        listOfQuestions = [
            "The capital of BC is Vancouver",
            "5 squared is 25",
            "All insects have 6 legs",
            "Peppers are vegetables"
        ]
        
        listOfAnswers = [false, true, true, false]
        
        hasBeenAnswered = [false, false, false, false]
    }

    @IBAction func pressTrueButtonAction(_ sender: UIButton) {
        if (currentAnswer == true) {
            score += 1
            lblScoreOutlet.text = "Correct! Your score is now " + String(score) + " points."
        } else {
            lblScoreOutlet.text = "Incorrect. Your score is still " +  String(score) + " points."
        }
        initiateEndGameSequence()
    }
    
    @IBAction func pressFalseButtonAction(_ sender: UIButton) {
        if (currentAnswer == false) {
            score += 1
            lblScoreOutlet.text = "Correct! Your score is now " + String(score) + " points."
        } else {
            lblScoreOutlet.text = "Incorrect. Your score is still " +  String(score) + " points."
        }
        initiateEndGameSequence()
    }
    
    @IBAction func pressNewGameButtonAction(_ sender: UIButton) {
        for index in 0..<listOfQuestions.count {
            hasBeenAnswered[index] = false
        }
        chooseQuestion()
        score = 0
        lblScoreOutlet.text = "Score:"
        
        btnTrueOutlet.isEnabled = true
        btnFalseOutlet.isEnabled = true
        
    }
    
    func chooseRandomNumber() {
        randomNumber = Int(arc4random_uniform(UInt32(listOfQuestions.count)))
        if (hasBeenAnswered[randomNumber!] == true) {
            chooseRandomNumber()
        }
        hasBeenAnswered[randomNumber!] = true
    }
    
    func chooseQuestion() {
        chooseRandomNumber()
        currentQuestion = listOfQuestions[randomNumber!]
        currentAnswer = listOfAnswers[randomNumber!]
        lblQuestionOutlet.text = currentQuestion!
        
        
    }
    
    func initiateEndGameSequence() {
        if (checkIfOver() == true) {
            lblQuestionOutlet.text = "End of game. Your final score is: " + String(score) + "/" + String(listOfQuestions.count) + "points."
            
        } else {
            chooseQuestion()
        }
    }
    
    func checkIfOver() -> Bool {
        for index in 0..<listOfQuestions.count {
            if (hasBeenAnswered[index] == false) {
                return false
            }
        }
        btnTrueOutlet.isEnabled = false
        btnFalseOutlet.isEnabled = false
        return true
    }

}


































