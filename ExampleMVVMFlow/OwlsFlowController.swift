//
//  OwlsFlowController.swift
//  ExampleMVVMFlow
//
//  Created by apple on 03/07/16.
//  Copyright © 2016 Rodrigo Reis. All rights reserved.
//

import UIKit

class OwlsFlowController: FlowController, GridViewControllerDelegate, ListTableViewControllerDelegate {
    var showType = (UIDevice.current.userInterfaceIdiom == .pad) ? ShowType.grid : ShowType.list
    
    fileprivate let configure: FlowConfigure
    fileprivate let model = OwlModel()
    fileprivate let viewModel: ListViewModel<OwlModel>
    
    enum ShowType {
        case list
        case grid
    }
    
    required init(configure: FlowConfigure) {
        self.configure = configure
        viewModel = ListViewModel<OwlModel>(model: model)
    }
    
    func start() {
        switch showType {
        case .list:
            let configureTable = ConfigureTable(styleTable: .plain, title: "List of Owls",delegate: self)
            let viewController = ListTableViewController<OwlModel>(viewModel: viewModel, configure: configureTable) { owl, cell in
                cell.textLabel?.text = owl.name
            }
            configure.navigationController?.pushViewController(viewController, animated: false)
            break
        case .grid:
             let layoutGrid = UICollectionViewFlowLayout()
            layoutGrid.scrollDirection = .vertical
            let configureGrid = ConfigureGrid(viewLayout: layoutGrid, title: "Grid of Owls", delegate: self)
            let viewController = GridViewController<OwlModel>(configure: configureGrid) { owl, cell in
                cell.image?.image = owl.avatar
            }
             viewController.configure(viewModel:viewModel)
            configure.navigationController?.pushViewController(viewController, animated: false)
            break
        }
    }
    
    func openDetailFor(id : Int) {
        if let item = viewModel.item(ofIndex: id) {
            let detail = FlowConfigure(window: nil, navigationController: configure.navigationController, parent: self)
            let childFlow = OwlDetailFlowController(configure: detail,item: item)
            childFlow.start()
        }
    }
}
