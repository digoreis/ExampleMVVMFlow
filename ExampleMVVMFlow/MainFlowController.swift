//
//  MainFlowController.swift
//  ExampleMVVMFlow
//
//  Created by apple on 02/07/16.
//  Copyright © 2016 Rodrigo Reis. All rights reserved.
//

import UIKit


class MainFlowController : FlowController {
    let configure : FlowConfigure
    var childFlow : FlowController?
    
    required init(configure : FlowConfigure) {
        self.configure = configure
    }
    
    func start() {
        
        let navigationController = UINavigationController()
        if let frame = configure.window?.bounds {
            navigationController.view.frame = frame
        }
        
        configure.window?.rootViewController = navigationController
        configure.window?.makeKeyAndVisible()
        
        let owlConf = FlowConfigure(window: nil, navigationController: navigationController, parent: self)
        childFlow = OwlsFlowController(configure: owlConf)
        childFlow?.start()
    }
}
