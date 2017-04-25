//
//  OwlDetailFlowController.swift
//  ExampleMVVMFlow
//
//  Created by apple on 06/07/16.
//  Copyright © 2016 Rodrigo Reis. All rights reserved.
//

import UIKit

class OwlDetailFlowController: FlowController, DetailViewControllerDelegate {
    var showType = (UIDevice.current.userInterfaceIdiom == .pad) ? ShowType.screen: ShowType.overlay
    
    fileprivate let configure: FlowConfigure
    fileprivate var viewModel: DetailModel?
    
    enum ShowType {
        case screen
        case overlay
    }

    init(configure : FlowConfigure, item : DetailModel) {
        viewModel = item
        self.configure = configure
    }
    
    required init(configure : FlowConfigure) {
        self.configure = configure
    }
    
    func start() {
        switch showType {
        case .screen:
            let configureDetail = ConfigureDetail(title: "Detail", delegate: self, modal: false)
             let viewController = OwlDetailViewController<Owl>(viewModel: viewModel!, configure: configureDetail)
            configure.navigationController?.pushViewController(viewController, animated: false)
            break
        case .overlay:
            let configureDetail = ConfigureDetail(title: "Detail", delegate: self, modal: true)
            let viewController = OwlDetailViewController<Owl>(viewModel: viewModel!, configure: configureDetail)
            viewController.modalPresentationStyle = .overCurrentContext
            configure.navigationController?.present(viewController, animated: false,completion : nil)

            break
        }
    }
    
    func close() {
        // Go back to the list/grid
    }
    
}
