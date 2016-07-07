//
//  OwlDetailViewController.swift
//  ExampleMVVMFlow
//
//  Created by apple on 06/07/16.
//  Copyright © 2016 Rodrigo Reis. All rights reserved.
//

import Foundation

import UIKit

struct ConfigureDetail {
    let title : String
    let delegate : DetailViewControllerDelegate
}

protocol DetailViewControllerDelegate {
    func close()
}

class OwlDetailViewController<M : DetailModel>: UIViewController {
    var viewModel : DetailModel
    
    var lblName : UILabel
    
    init(viewModel model : DetailModel, configure : ConfigureDetail) {
        self.viewModel = model
        lblName = UILabel(frame: CGRect(x: 10, y: 80, width: 200, height: 20))
        super.init(nibName: nil, bundle: nil)
        view.addSubview(lblName)
        title = configure.title
    }
    
    
    
    override func viewDidLoad() {
        lblName.text = viewModel.title()
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


