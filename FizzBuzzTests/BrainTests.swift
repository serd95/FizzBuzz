//
//  BrainTests.swift
//  FizzBuzz
//
//  Created by Drew Bigelow on 5/9/16.
//  Copyright © 2016 Drew Bigelow. All rights reserved.
//

import XCTest
@testable import FizzBuzz

class BrainTests: XCTestCase {
    
    let brain = Brain()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIsDivisibleByThree() {
        let result = brain.isDivisibleByThree(3)
        XCTAssertEqual(result, true)
    }
    
    func testIsNotDivisibleByThree() {
        let result = brain.isDivisibleByThree(1)
        XCTAssertEqual(result, false)
    }
    
    func testIsDivisibleByFive() {
        let result = brain.isDivisibleByFive(5)
        XCTAssertEqual(result, true)
    }
    
    func testIsNotDivisibleByFive() {
        let result = brain.isDivisibleByFive(7)
        XCTAssertEqual(result, false)
    }
    
    func testIsDivisibleByBoth() {
        let result = brain.isDivisibleByBoth(15)
        XCTAssertEqual(result, true)
    }
    
    func testIsNotDivisibleByBoth() {
        let result = brain.isDivisibleByBoth(47)
        XCTAssertEqual(result, false)
    }
    
    func testSayFizz() {
        let result = brain.check(3)
        XCTAssertEqual(result, Move.Fizz)
    }
    
    func testSayBuzz() {
        let result = brain.check(5)
        XCTAssertEqual(result, Move.Buzz)
    }
    
    func testSayNumber() {
        let result = brain.check(1)
        XCTAssertEqual(result, Move.Number)
    }

}
