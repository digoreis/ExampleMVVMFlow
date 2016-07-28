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
    
    func testMainFlowWindow() {
        let window = UIWindow(frame : UIScreen.mainScreen().bounds)
        let configure = FlowConfigure(window: window, navigationController: nil, parent: nil)
        let mainFlow = MainFlowController(configure: configure)
        mainFlow.start()
        XCTAssertTrue(true)
    }
    
    func testMainFlowNavigation() {
        let navigationController = UINavigationController()
        let configure = FlowConfigure(window: nil, navigationController: navigationController, parent: nil)
        let mainFlow = MainFlowController(configure: configure)
        mainFlow.start()
        XCTAssertTrue(true)
    }
    
    func testOwlsFlowWindow() {
        let window = UIWindow(frame : UIScreen.mainScreen().bounds)
        let owlConf = FlowConfigure(window: window, navigationController: nil, parent: nil)
        let childFlow = OwlsFlowController(configure: owlConf)
        childFlow.showType = OwlsFlowController.ShowType.List
        childFlow.start()
        XCTAssertTrue(true)
        childFlow.openDetail(0)
        XCTAssertTrue(true)
        childFlow.showType = OwlsFlowController.ShowType.Grid
        childFlow.start()
        XCTAssertTrue(true)
        childFlow.openDetail(0)
        XCTAssertTrue(true)
    }
    
    func testOwlsFlowNavigation() {
        let navigationController = UINavigationController()
        let owlConf = FlowConfigure(window: nil, navigationController: navigationController, parent: nil)
        let childFlow = OwlsFlowController(configure: owlConf)
        childFlow.showType = OwlsFlowController.ShowType.List
        childFlow.start()
        XCTAssertTrue(true)
        childFlow.openDetail(0)
        XCTAssertTrue(true)
        childFlow.showType = OwlsFlowController.ShowType.Grid
        childFlow.start()
        XCTAssertTrue(true)
        childFlow.openDetail(0)
        XCTAssertTrue(true)
    }
    
    func testDetailOwlFlowWindow() {
        let window = UIWindow(frame : UIScreen.mainScreen().bounds)
        let detail = FlowConfigure(window: window, navigationController: nil, parent: nil)
        let modelOwl = OwlModel()
        let list = ListViewModel<OwlModel>(model: modelOwl)
        if let item = list.item(ofIndex: 0) {
            let childFlow = OwlDetailFlowController(configure: detail,item: item)
            childFlow.showType = OwlDetailFlowController.ShowType.Screen
            childFlow.start()
            XCTAssertTrue(true)
            childFlow.showType = OwlDetailFlowController.ShowType.Overlay
            childFlow.start()
            XCTAssertTrue(true)
        }
        let childFlow = OwlDetailFlowController(configure: detail)
        childFlow.close()
        XCTAssertTrue(true)
    }
    
    func testDetailOwlFlowNavigation() {
        let navigationController = UINavigationController()
        let detail = FlowConfigure(window: nil, navigationController: navigationController, parent: nil)
        let modelOwl = OwlModel()
        let list = ListViewModel<OwlModel>(model: modelOwl)
        if let item = list.item(ofIndex: 0) {
            let childFlow = OwlDetailFlowController(configure: detail,item: item)
            childFlow.showType = OwlDetailFlowController.ShowType.Screen
            childFlow.start()
            XCTAssertTrue(true)
            childFlow.showType = OwlDetailFlowController.ShowType.Overlay
            childFlow.start()
            XCTAssertTrue(true)
        }
        let childFlow = OwlDetailFlowController(configure: detail)
        childFlow.close()
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
    
    func testFlowDetectTypeNil() {
        let configure = FlowConfigure(window: nil, navigationController: nil, parent: nil)
        XCTAssertNil(configure.whichFlowIam())
    }
    
}
