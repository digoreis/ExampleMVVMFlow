//
//  FlowController.swift
//  ExampleMVVMFlow
//
//  Created by apple on 02/07/16.
//  Copyright © 2016 Rodrigo Reis. All rights reserved.
//

import UIKit

enum FlowType {
    case Main
    case Navigation
}

struct FlowConfigure {
    let window : UIWindow?
    let navigationController : UINavigationController?
    let parent : FlowController?
    
    func whichFlowIam() -> FlowType? {
        if window != nil { return .Main }
        if navigationController != nil { return .Navigation }
        return nil
    }
}

protocol FlowController {
    init(configure : FlowConfigure)
    func start()
}
