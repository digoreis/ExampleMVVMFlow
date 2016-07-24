//
//  FlowTests.swift
//  ExampleMVVMFlow
//
//  Created by apple on 24/07/16.
//  Copyright © 2016 Rodrigo Reis. All rights reserved.
//

import XCTest
@testable import ExampleMVVMFlow

class FlowTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMainFlow() {
        let window = UIWindow(frame : UIScreen.mainScreen().bounds)
        let configure = FlowConfigure(window: window, navigationController: nil, parent: nil)
        let mainFlow = MainFlowController(configure: configure)
        mainFlow.start()
        XCTAssertTrue(true)
    }
    
    func testOwlsFlow() {
        let window = UIWindow(frame : UIScreen.mainScreen().bounds)
        let owlConf = FlowConfigure(window: window, navigationController: nil, parent: nil)
        let childFlow = OwlsFlowController(configure: owlConf)
        childFlow.start()
        XCTAssertTrue(true)
    }
    
    func testDetailOwlFlow() {
        let window = UIWindow(frame : UIScreen.mainScreen().bounds)
        let detail = FlowConfigure(window: window, navigationController: nil, parent: nil)
        let modelOwl = OwlModel()
        let list = ListViewModel<OwlModel>(model: modelOwl)
        if let item = list.item(ofIndex: 0) {
            let childFlow = OwlDetailFlowController(configure: detail,item: item)
            childFlow.start()
        }
        XCTAssertTrue(true)
    }
    
    func testFlowDetectTypeMain() {
        let window = UIWindow(frame : UIScreen.mainScreen().bounds)
        let configure = FlowConfigure(window: window, navigationController: nil, parent: nil)
        XCTAssertTrue(configure.whichFlowIam() == .Main)
    }
    
    func testFlowDetectTypeNavigation() {
        let navigation = UINavigationController()
        let configure = FlowConfigure(window: nil, navigationController: navigation, parent: nil)
        XCTAssertTrue(configure.whichFlowIam() == .Navigation)
    }
    
}
