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
    
    func testExample() {
        let modelOwl = OwlModel()
        let list = ListViewModel<OwlModel>(model: modelOwl)
        list.printAll()
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
