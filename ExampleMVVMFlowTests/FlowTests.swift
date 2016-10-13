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
        let window = UIWindow(frame : UIScreen.main.bounds)
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
        let window = UIWindow(frame : UIScreen.main.bounds)
        let owlConf = FlowConfigure(window: window, navigationController: nil, parent: nil)
        let childFlow = OwlsFlowController(configure: owlConf)
        childFlow.showType = OwlsFlowController.ShowType.list
        childFlow.start()
        XCTAssertTrue(true)
        childFlow.openDetailFor(id: 0)
        XCTAssertTrue(true)
        childFlow.showType = OwlsFlowController.ShowType.grid
        childFlow.start()
        XCTAssertTrue(true)
        childFlow.openDetailFor(id: 0)
        XCTAssertTrue(true)
    }
    
    func testOwlsFlowNavigation() {
        let navigationController = UINavigationController()
        let owlConf = FlowConfigure(window: nil, navigationController: navigationController, parent: nil)
        let childFlow = OwlsFlowController(configure: owlConf)
        childFlow.showType = OwlsFlowController.ShowType.list
        childFlow.start()
        XCTAssertTrue(true)
        childFlow.openDetailFor(id: 0)
        XCTAssertTrue(true)
        childFlow.showType = OwlsFlowController.ShowType.grid
        childFlow.start()
        XCTAssertTrue(true)
        childFlow.openDetailFor(id: 0)
        XCTAssertTrue(true)
    }
    
    func testDetailOwlFlowWindow() {
        let window = UIWindow(frame : UIScreen.main.bounds)
        let detail = FlowConfigure(window: window, navigationController: nil, parent: nil)
        let modelOwl = OwlModel()
        let list = ListViewModel<OwlModel>(model: modelOwl)
        if let item = list.item(ofIndex: 0) {
            let childFlow = OwlDetailFlowController(configure: detail,item: item)
            childFlow.showType = OwlDetailFlowController.ShowType.screen
            childFlow.start()
            XCTAssertTrue(true)
            childFlow.showType = OwlDetailFlowController.ShowType.overlay
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
            childFlow.showType = OwlDetailFlowController.ShowType.screen
            childFlow.start()
            XCTAssertTrue(true)
            childFlow.showType = OwlDetailFlowController.ShowType.overlay
            childFlow.start()
            XCTAssertTrue(true)
        }
        let childFlow = OwlDetailFlowController(configure: detail)
        childFlow.close()
        XCTAssertTrue(true)
    }
    
    func testFlowDetectTypeMain() {
        let window = UIWindow(frame : UIScreen.main.bounds)
        let configure = FlowConfigure(window: window, navigationController: nil, parent: nil)
        XCTAssertTrue(configure.whichFlowAmI() == .main)
    }
    
    func testFlowDetectTypeNavigation() {
        let navigation = UINavigationController()
        let configure = FlowConfigure(window: nil, navigationController: navigation, parent: nil)
        XCTAssertTrue(configure.whichFlowAmI() == .navigation)
    }
    
    func testFlowDetectTypeNil() {
        let configure = FlowConfigure(window: nil, navigationController: nil, parent: nil)
        XCTAssertNil(configure.whichFlowAmI())
    }
    
}
