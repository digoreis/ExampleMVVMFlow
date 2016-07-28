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


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame : UIScreen.mainScreen().bounds)
        
        if let window = window where NSProcessInfo.processInfo().arguments.contains("UITestRun") {
            FlowTestRouter.selectRoute(window, routes: NSProcessInfo.processInfo().arguments)
            return true
        }
        

    
        let configure = FlowConfigure(window: window, navigationController: nil, parent: nil)
        let mainFlow = MainFlowController(configure: configure)
        mainFlow.start()
        
        return true
    }

}

