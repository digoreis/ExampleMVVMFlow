//
//  ExampleMVVMFlowTests.swift
//  ExampleMVVMFlowTests
//
//  Created by apple on 02/07/16.
//  Copyright © 2016 Rodrigo Reis. All rights reserved.
//

import XCTest
@testable import ExampleMVVMFlow

class ExampleMVVMFlowTests: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFailCount() {
        let modelOwl = OwlModel()
        let list = ListViewModel<OwlModel>(model: modelOwl)
        XCTAssertNotEqual(list.count(), 0)
    }
    
    func testSuccessCount() {
        let modelOwl = OwlModel()
        let list = ListViewModel<OwlModel>(model: modelOwl)
        XCTAssertEqual(list.count(), 21)
    }
    
    func testFailGetItem() {
    let modelOwl = OwlModel()
    let list = ListViewModel<OwlModel>(model: modelOwl)
        XCTAssertNil(list.item(ofIndex: -1))
        XCTAssertNil(list.item(ofIndex: list.count()))
    }
    
    func testSuccessGetItem() {
        let modelOwl = OwlModel()
        let list = ListViewModel<OwlModel>(model: modelOwl)
        XCTAssertNotNil(list.item(ofIndex: 0))
        XCTAssertNotNil(list.item(ofIndex: list.count() - 1))
    }
    
    func testSuccessDetailItem() {
        let modelOwl = OwlModel()
        let list = ListViewModel<OwlModel>(model: modelOwl)
        for i in 0 ..< list.count() {
            let item = list.item(ofIndex: i)
            XCTAssertNotNil(item?.title())
            XCTAssertNotNil(item?.text())
            XCTAssertNotNil(item?.image())
        }
    }
    
}
