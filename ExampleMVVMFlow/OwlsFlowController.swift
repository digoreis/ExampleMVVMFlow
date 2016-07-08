//
//  OwlsFlowController.swift
//  ExampleMVVMFlow
//
//  Created by apple on 03/07/16.
//  Copyright © 2016 Rodrigo Reis. All rights reserved.
//

import UIKit



class OwlsFlowController : FlowController, GridViewControllerDelegate, ListTableViewControllerDelegate {
    
    private let showType = ShowType.List
    private let configure : FlowConfigure
    private let model = OwlModel()
    private let viewModel : ListViewModel<OwlModel>
    
    required init(configure : FlowConfigure) {
        self.configure = configure
        viewModel = ListViewModel<OwlModel>(model: model)
    }
    
    func start() {
        
        switch showType {
        case .List:
            let configureTable = ConfigureTable(styleTable: .Plain, title: "List of Owls",delegate: self)
            let viewController = ListTableViewController<OwlModel>(viewModel: viewModel, configure: configureTable) { owl, cell in
                cell.textLabel?.text = owl.name
            }
            configure.navigationController?.pushViewController(viewController, animated: false)
            break
        case .Grid:
             let layoutGrid = UICollectionViewFlowLayout()
            layoutGrid.scrollDirection = .Vertical
            let configureGrid = ConfigureGrid(viewLayout: layoutGrid, title: "Grid of Owls", delegate: self)
            let viewController = GridViewController<OwlModel>(configure: configureGrid) { owl, cell in
                cell.image?.image = owl.avatar
            }
             viewController.configure(viewModel:viewModel)
            configure.navigationController?.pushViewController(viewController, animated: false)
            break
        }
        
    }
    
    private enum ShowType {
        case List
        case Grid
    }
    
    func openDetail(id : Int) {
         let detail = FlowConfigure(window: nil, navigationController: configure.navigationController, parent: self)
         let childFlow = OwlDetailFlowController(configure: detail,item: viewModel.item(ofIndex: id))
         childFlow.start()
    }
}