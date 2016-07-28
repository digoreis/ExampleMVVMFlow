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
        XCTAssertTrue(app.collectionViews.cells.count == 8)
    }
    
    func testListViewControllerOpenDetail() {
        app.collectionViews.cells.elementBoundByIndex(0).tap()
        XCTAssertTrue(app.staticTexts["Ambassador"].exists)
    }
    
}