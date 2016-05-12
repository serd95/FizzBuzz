//
//  Brain.swift
//  FizzBuzz
//
//  Created by Drew Bigelow on 5/9/16.
//  Copyright © 2016 Drew Bigelow. All rights reserved.
//

import Foundation

class Brain: NSObject {
    
    func isDivisibleBy(divisor: Int, number: Int) -> Bool {
        return number % divisor == 0
    }
    
    func isDivisibleByThree(number: Int) -> Bool {
        return isDivisibleBy(3, number: number)
    }
    
    func isDivisibleByFive(number: Int) -> Bool {
        return isDivisibleBy(5, number: number)
    }
    
    func isDivisibleByBoth(number: Int) -> Bool {
        return isDivisibleByThree(number) && isDivisibleByFive(number)
    }
    
    func check(number: Int) -> Move {
        if isDivisibleByBoth(number)
        {
            return Move.FizzBuzz
        }
        else if isDivisibleByThree(number)
        {
            return Move.Fizz
        }
        else if isDivisibleByFive(number)
        {
            return Move.Buzz
        }
        else
        {
            return Move.Number
        }
    }
}
