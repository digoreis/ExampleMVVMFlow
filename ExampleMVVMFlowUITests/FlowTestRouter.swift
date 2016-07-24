//
//  FlowTest.swift
//  ExampleMVVMFlow
//
//  Created by apple on 24/07/16.
//  Copyright © 2016 Rodrigo Reis. All rights reserved.
//
import UIKit

class FlowTestRouter {
    
    static func selectRoute(window : UIWindow , routes : [String]) {
        if routes.contains("uitest-list") {
            let navigationController = UINavigationController()
            let frame = window.bounds
            navigationController.view.frame = frame
            
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
            
            let owlConf = FlowConfigure(window: nil, navigationController: navigationController, parent: nil)
            
            let childFlow = OwlsFlowController(configure: owlConf)
            childFlow.start()
        } else if routes.contains("uitest-detail") {
            let navigationController = UINavigationController()
            let frame = window.bounds
            navigationController.view.frame = frame
            
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
            
            let owlConf = FlowConfigure(window: nil, navigationController: navigationController, parent: nil)
            let modelMock = Owl(name: "Name", description: "Description", avatar: UIImage(named: "512px-owly-ambassador"))
            let childFlow = OwlDetailFlowController(configure: owlConf, item: modelMock)
            childFlow.start()
        }
    }
}