
//
//  Calculator_DemoUITests.swift
//  Calculator-DemoUITests
//
//  Created by Jubin Jacob on 15/06/16.
//  Copyright © 2016 J. All rights reserved.
//

import XCTest

class Calculator_DemoUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSum() {
        XCUIDevice.shared().orientation = .portrait
        
        let app = XCUIApplication()
        app.buttons["5"].tap()
        app.buttons["+"].tap()
        app.buttons["9"].tap()
        app.buttons["*"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
        let label = app.staticTexts.element(matching: .any, identifier: "Result").label
        XCTAssert(label == "28")
        
    }
    
    func testClearButton() {
        XCUIDevice.shared().orientation = .portrait
        
        let app = XCUIApplication()
        app.buttons["1"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["C"].tap()
        app.buttons["5"].tap()
        app.buttons["="].tap()
        let label = app.staticTexts.element(matching: .any, identifier: "Result").label
        XCTAssert(label == "6")
        
    }
    
}
