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
    
    private func wait(seconds: NSTimeInterval) {
        let dateAfterWait = NSDate(timeIntervalSinceNow: seconds)
        NSRunLoop.mainRunLoop().runUntilDate(dateAfterWait)
    }
    
    var correctMove : Bool? {
        didSet {
            if correctMove == false
            {
                backgroundView.backgroundColor = UIColor(hue: 0.0194, saturation: 1, brightness: 0.97, alpha: 1.0) /* #f71c00 */
                
                wait(0.2)
                
                backgroundView.backgroundColor = UIColor(red: 0.1451, green: 0.8275, blue: 0.8, alpha: 1.0) /* #25d3cc */
            }
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
        correctMove = response.right
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
    
    @IBOutlet weak var backgroundView: UIView!
}

