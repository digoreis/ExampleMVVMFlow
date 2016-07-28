//
//  ViewControllersTests.swift
//  ExampleMVVMFlow
//
//  Created by apple on 24/07/16.
//  Copyright © 2016 Rodrigo Reis. All rights reserved.
//

import XCTest
@testable import ExampleMVVMFlow

class ViewControllersTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testListViewController() {
        let modelOwl = OwlModel()
        let viewModel = ListViewModel<OwlModel>(model: modelOwl)
        let configureTable = ConfigureTable(styleTable: .Plain, title: "List of Owls",delegate: DelegateMock())
        _ = ListTableViewController<OwlModel>(viewModel: viewModel, configure: configureTable) { owl, cell in
            XCTAssertNotNil(owl)
            XCTAssertNotNil(cell)
        }
    }
    
    func testGridController() {
        let modelOwl = OwlModel()
        let viewModel = ListViewModel<OwlModel>(model: modelOwl)
        let layoutGrid = UICollectionViewFlowLayout()
        layoutGrid.scrollDirection = .Vertical
        let configureGrid = ConfigureGrid(viewLayout: layoutGrid, title: "Grid of Owls", delegate: DelegateMock())
        let viewController = GridViewController<OwlModel>(configure: configureGrid) { owl, cell in
            XCTAssertNotNil(owl)
            XCTAssertNotNil(cell)
        }
        viewController.configure(viewModel:viewModel)
        XCTAssertEqual(viewController.collectionView(viewController.collectionView!, numberOfItemsInSection: 0), 21)
        XCTAssertEqual(viewController.collectionView?.numberOfSections(), 1)
        let cell = viewController.collectionView(viewController.collectionView!, cellForItemAtIndexPath: NSIndexPath(forItem: 0, inSection: 0))
        XCTAssertNotNil(cell)
        viewController.collectionView(viewController.collectionView!, didSelectItemAtIndexPath: NSIndexPath(forItem: 0, inSection: 0))
        XCTAssertTrue(true)
    }
    
    func testGridControllerWarning() {
        let modelOwl = OwlModel()
        let viewModel = ListViewModel<OwlModel>(model: modelOwl)
        let layoutGrid = UICollectionViewFlowLayout()
        layoutGrid.scrollDirection = .Vertical
        let configureGrid = ConfigureGrid(viewLayout: layoutGrid, title: "Grid of Owls", delegate: DelegateMock())
        let viewController = GridViewController<OwlModel>(configure: configureGrid) { owl, cell in
            XCTAssertNotNil(owl)
            XCTAssertNotNil(cell)
        }
        viewController.configure(viewModel:viewModel)
        viewController.didReceiveMemoryWarning()
        XCTAssertTrue(true)
    }

    
    func testDetailController() {
        let modelOwl = OwlModel()
        let viewModel = ListViewModel<OwlModel>(model: modelOwl)
        let item = viewModel.item(ofIndex: 0)
        let configureDetail = ConfigureDetail(title: "Detail", delegate: DetailDelegateMock(), modal: false)
        let _ = OwlDetailViewController<Owl>(viewModel: item!, configure: configureDetail)
        XCTAssertTrue(true)
    }
    
    
    class DelegateMock : ListTableViewControllerDelegate,GridViewControllerDelegate {
        func openDetail(id : Int) {
            
        }
    }
    
    class DetailDelegateMock : DetailViewControllerDelegate {
        func close() {
            
        }
    }
}