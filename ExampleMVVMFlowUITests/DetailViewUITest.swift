//
//  DetailViewUITest.swift
//  ExampleMVVMFlow
//
//  Created by apple on 24/07/16.
//  Copyright © 2016 Rodrigo Reis. All rights reserved.
//

import XCTest
@testable import ExampleMVVMFlow

class DetailViewUITest: XCTestCase {
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = true
        app.launchArguments.append("UITestRun")
        app.launchArguments.append("uitest-detail")
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDetectLabels() {
        XCTAssertTrue(app.staticTexts["Name"].exists)
        XCTAssertTrue(app.staticTexts["Description"].exists)
        XCTAssertTrue(app.images["512px-owly-ambassador"].exists)
    }
    
    func testErrorLabels() {
        XCTAssertFalse(app.staticTexts["NameFail"].exists)
        XCTAssertFalse(app.staticTexts["DescriptionFail"].exists)
        XCTAssertFalse(app.images["512px-fail"].exists)
    }
    
}
