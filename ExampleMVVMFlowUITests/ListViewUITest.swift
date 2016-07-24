//
//  ListViewUITest.swift
//  ExampleMVVMFlow
//
//  Created by apple on 24/07/16.
//  Copyright © 2016 Rodrigo Reis. All rights reserved.
//

import XCTest
@testable import ExampleMVVMFlow

class ListViewUITest: XCTestCase {
    let app = XCUIApplication()
    override func setUp() {
        super.setUp()
        continueAfterFailure = true
        app.launchArguments.append("UITestRun")
        app.launchArguments.append("uitest-list")
        app.launch()

    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testListViewControllerItens() {
      XCTAssertTrue(app.tables.cells.count == 21)
    }
    
    func testListViewControllerOpenDetail() {
        app.tables.cells.elementBoundByIndex(0).tap()
        XCTAssertTrue(app.staticTexts["Ambassador"].exists)
    }
    
}
