//
//  OwlDetailFlowController.swift
//  ExampleMVVMFlow
//
//  Created by apple on 06/07/16.
//  Copyright © 2016 Rodrigo Reis. All rights reserved.
//

import UIKit


class OwlDetailFlowController : FlowController, DetailViewControllerDelegate {
    
    private let showType = ShowType.Screen
    private let configure : FlowConfigure
    private var viewModel : DetailModel?
    
    init(configure : FlowConfigure, item : DetailModel) {
        viewModel = item
        self.configure = configure
    }
    
    required init(configure : FlowConfigure) {
        self.configure = configure
    }
    
    func start() {
        
        switch showType {
        case .Screen:
            let configureDetail = ConfigureDetail(title: "Detail", delegate: self)
             let viewController = OwlDetailViewController<Owl>(viewModel: viewModel!, configure: configureDetail)
            configure.navigationController?.pushViewController(viewController, animated: false)
            break
        case .Overlay:
            
          //  configure.navigationController?.pushViewController(viewController, animated: false)
            break
        }
        
    }
    
    func close(){
        
    }
    
    private enum ShowType {
        case Screen
        case Overlay
    }
}
