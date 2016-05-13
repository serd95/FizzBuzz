//
//  GameTests.swift
//  FizzBuzz
//
//  Created by Drew Bigelow on 5/9/16.
//  Copyright © 2016 Drew Bigelow. All rights reserved.
//

import XCTest
@testable import FizzBuzz

class GameTests: XCTestCase {
    
    let game = Game()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGameStartsAtZero() {
        XCTAssertTrue(game.score == 0)
    }
    
    func testOnPlayScoreIncremented() {
        game.play(Move.Number)
        XCTAssertTrue(game.score == 1)
    }
    
    func testIfMoveIsRight() {
        game.score = 2
        let response = game.play(Move.Fizz)
        let result = response.right
        XCTAssertEqual(result, true)
    }
    
    func testIfMoveIsWrong() {
        game.score = 1
        let response = game.play(Move.Fizz)
        let result = response.right
        XCTAssertEqual(result, false)
    }
    
    func testIfBuzzMoveIsRight() {
        game.score = 4
        let response = game.play(Move.Buzz)
        let result = response.right
        XCTAssertEqual(result, true)
    }
    
    func testIfBuzzMoveIsWrong() {
        game.score = 11
        let response = game.play(Move.Buzz)
        let result = response.right
        XCTAssertEqual(result, false)
    }
    
    func testIfFizzBuzzMoveIsRight() {
        game.score = 14
        let response = game.play(Move.FizzBuzz)
        let result = response.right
        XCTAssertEqual(result, true)
    }
    
    func testIfFizzBuzzMoveIsWrong() {
        game.score = 11
        let response = game.play(Move.FizzBuzz)
        let result = response.right
        XCTAssertEqual(result, false)
    }
    
    func testIfNumberMoveIsRight() {
        game.score = 6
        let response = game.play(Move.Number)
        let result = response.right
        XCTAssertEqual(result, true)
    }
    
    func testIfNumberMoveIsWrong() {
        game.score = 4
        let response = game.play(Move.Number)
        let result = response.right
        XCTAssertEqual(result, false)
    }
    
//    func testIfMoveWrongScoreNotIncremented() {
//        game.score = 1
//        game.play(Move.Fizz)
//        XCTAssertEqual(game.score, 1)
//    }
    
    func testPlayShouldReturnIfMoveRight() {
        let response = game.play(Move.Number)
        XCTAssertNotNil(response.right)
    }
    
    func testPlayShouldReturnNewScore() {
        let response = game.play(Move.Number)
        XCTAssertNotNil(response.score)
    }
    
    func testGameResetOnWrongMove() {
        game.score = 4
        let response = game.play(Move.FizzBuzz)
        let result = response.score
        XCTAssertEqual(result, 0)
    }
}
