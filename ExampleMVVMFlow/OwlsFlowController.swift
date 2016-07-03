//
//  OwlsFlowController.swift
//  ExampleMVVMFlow
//
//  Created by apple on 03/07/16.
//  Copyright © 2016 Rodrigo Reis. All rights reserved.
//

import UIKit

enum ShowType {
    case List
    case Grid
}

let showType = ShowType.Grid

class OwlsFlowController : FlowController {
    let configure : FlowConfigure
    let model = OwlModel()
    let viewModel : ListViewModel<OwlModel>
    
    required init(configure : FlowConfigure) {
        self.configure = configure
        viewModel = ListViewModel<OwlModel>(model: model)
    }
    
    func start() {
        
        switch showType {
        case .List:
            let configureTable = ConfigureTable(styleTable: .Plain, title: "List of Owls")
            let viewController = ListTableViewController<OwlModel>(viewModel: viewModel, configure: configureTable) { (owl, cell) -> (Void) in
                cell.textLabel?.text = owl.name
            }
            configure.navigationController?.pushViewController(viewController, animated: false)
            break
        case .Grid:
            let layoutGrid = UICollectionViewFlowLayout()
            layoutGrid.scrollDirection = .Vertical
            let configureGrid = ConfigureGrid(viewLayout: layoutGrid, title: "List of Owls")
            let viewController = GridViewController<OwlModel>(viewModel: viewModel, configure: configureGrid) { (owl, cell) -> (Void) in
                cell.image?.image = owl.image
            }
            configure.navigationController?.pushViewController(viewController, animated: false)
            break
        }
        
    }
}