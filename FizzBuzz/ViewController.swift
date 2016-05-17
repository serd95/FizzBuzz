//
//  ViewController.swift
//  FizzBuzz
//
//  Created by Drew Bigelow on 5/9/16.
//  Copyright © 2016 Drew Bigelow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gameScore : Int? {
        didSet {
            guard let unwrappedScore = gameScore else {
                print("gameScore is nil")
                return
            }
            numberButton.setTitle("\(unwrappedScore)", forState: .Normal)
        }
    }

    
    var game : Game?
    
    var highScore : Int? {
        didSet {
            guard let unwrappedHighScore = highScore else {
                print("highScore is nil")
                return
            }
            scoreLabel.text = ("\(unwrappedHighScore)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game()
        guard let checkedGame = game else {
            print("Game is nil")
            return
        }
        gameScore = checkedGame.score
        highScore = checkedGame.highScore
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func play(move: Move) {
        guard let unwrappedGame = game else {
            print("Game is nil!")
            return
        }
        let response = unwrappedGame.play(move)
        gameScore = response.score
        highScore = response.highScore
    }

    @IBAction func buttonTapped(sender: UIButton) {
        switch sender {
            case numberButton:
                play(Move.Number)
            case fizzButton:
                play(Move.Fizz)
            case buzzButton:
                play(Move.Buzz)
            case fizzBuzzButton:
                play(Move.FizzBuzz)
            case playAgainButton:
                if gameScore >= highScore
                {
                    highScore = gameScore
                }
                
                gameScore = 0
                game?.score = 0
            default:
            print("Invalid selection")
        
        }
        

    }
    
    
    @IBOutlet weak var numberButton: UIButton!
    
    @IBOutlet weak var fizzButton: UIButton!

    @IBOutlet weak var buzzButton: UIButton!
    
    @IBOutlet weak var fizzBuzzButton: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
}

