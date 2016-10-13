//
//  GridViewUITest.swift
//  ExampleMVVMFlow
//
//  Created by Reis on 7/28/16.
//  Copyright © 2016 Rodrigo Reis. All rights reserved.
//

import XCTest
@testable import ExampleMVVMFlow

class GridViewUITest: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = true
        app.launchArguments.append("UITestRun")
        app.launchArguments.append("uitest-grid")
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testListViewControllerItens() {
        // Split these variables out to aid debugging
        let views = app.collectionViews
        let cells = views.cells
        let count = cells.count
        // This test is dependent on the test device being used! 7+ is 18, 6S is 10...
        XCTAssertTrue(count > 4)  // Changed to cover the bare minimum expected!
    }
    
    func testListViewControllerOpenDetail() {
        app.collectionViews.cells.element(boundBy: 0).tap()
        XCTAssertTrue(app.staticTexts["Ambassador"].exists)
    }
    
}
