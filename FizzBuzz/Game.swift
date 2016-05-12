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
    let brain: Brain
    
    override init() {
        score = 0
        brain = Brain()
        super.init()
    }
    
    func play(move: Move) ->(right: Bool, score: Int)  {
       
        let result = brain.check(score + 1)
        
        if result == move
        {
            score = score + 1
            return (true, score)
        }
        else
        {
            return (false, score)
        }
    }
    
    
}