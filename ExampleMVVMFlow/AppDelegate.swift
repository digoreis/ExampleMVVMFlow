//
//  AppDelegate.swift
//  ExampleMVVMFlow
//
//  Created by apple on 02/07/16.
//  Copyright © 2016 Rodrigo Reis. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame : UIScreen.main.bounds)
        
        if let window = window, ProcessInfo.processInfo.arguments.contains("UITestRun") {
            FlowTestRouter.selectRoute(window, routes: ProcessInfo.processInfo.arguments)
            return true
        }
    
        let configure = FlowConfigure(window: window, navigationController: nil, parent: nil)
        let mainFlow = MainFlowController(configure: configure)
        mainFlow.start()
        
        return true
    }

}

