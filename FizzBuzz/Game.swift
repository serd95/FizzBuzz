//
//  Game.swift
//  FizzBuzz
//
//  Created by Drew Bigelow on 5/9/16.
//  Copyright © 2016 Drew Bigelow. All rights reserved.
//

import Foundation

class Game: NSObject {
    
    var score: Int
    var highScore: Int
    let brain: Brain
    
    override init() {
        score = 0
        highScore = 0
        brain = Brain()
        super.init()
    }
    
    func play(move: Move) ->(right: Bool, score: Int, highScore: Int)  {
       
        let result = brain.check(score + 1)
        
        if result == move
        {
            score = score + 1
            
            if score >= highScore
            {
                highScore = score
            }
            
            return (true, score, highScore)
        }
        else
        {
            score = 0
            return (false, score, highScore)
        }
    }
    
    
}