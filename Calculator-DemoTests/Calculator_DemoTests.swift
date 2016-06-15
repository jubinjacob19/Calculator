//
//  Calculator_DemoTests.swift
//  Calculator-DemoTests
//
//  Created by Jubin Jacob on 15/06/16.
//  Copyright © 2016 J. All rights reserved.
//

import XCTest
@testable import Calculator_Demo

class Calculator_DemoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddOperator() {
        let add = Add()
        let result = add.evaluate(5, rhs: 4)
        XCTAssert(result == 9.0)
    }
    
    func testSubtractOperator() {
        let subtract = Subtract()
        let result = subtract.evaluate(0, rhs: 7)
        XCTAssert(result == -7.0)
    }
    
    func testMultiplyOperator() {
        let multiply = Multiply()
        let result = multiply.evaluate(2, rhs: 7)
        XCTAssert(result == 14.0)
    }
    
    
    
}
