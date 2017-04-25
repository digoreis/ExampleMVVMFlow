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
    let title: String
    let delegate: DetailViewControllerDelegate
    var modal: Bool = false
}

protocol DetailViewControllerDelegate {
    func close()
}

class OwlDetailViewController<M : DetailModel>: UIViewController {
    var viewModel: DetailModel
    let configure: ConfigureDetail
    var lblName: UILabel?
    var imgAvatar: UIImageView?
    var lblText: UILabel?
    var viewCenter: UIView?
    
    init(viewModel model: DetailModel, configure: ConfigureDetail) {
        self.viewModel = model
        self.configure = configure
        super.init(nibName: nil, bundle: nil)
        setupUI()
        title = configure.title
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        viewCenter = UIView(frame : CGRect(x: 10, y: 80, width: 200, height: 300))
        viewCenter?.layer.cornerRadius = 2.0
        viewCenter?.layer.masksToBounds = true
        viewCenter?.backgroundColor = UIColor.white
        viewCenter?.center = view.center
        
        lblName = UILabel(frame: CGRect(x: 10, y: 4, width: 200, height: 20))
        viewCenter?.addSubview(lblName!)
        imgAvatar = UIImageView(frame: CGRect(x: 10, y: 30, width: 120, height: 120))
        viewCenter?.addSubview(imgAvatar!)
        imgAvatar?.image = viewModel.image()
        lblText = UILabel(frame: CGRect(x: 10, y: 155, width: 200, height: 20))
        lblText?.text = viewModel.text().capitalized
        viewCenter?.addSubview(lblText!)
        view.addSubview(viewCenter!)
        lblName?.text = viewModel.title().capitalized
    }
    
    func configureModal() {
        view.backgroundColor = UIColor.clear
        view.isOpaque = false
        setupBlur()
        setupCloseButton()
        insertLine(y: 24, container: viewCenter!)
    }
    
    func setupBlur() {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        view.addSubview(blurEffectView)
    }
    
    func insertLine(y line : Int,container : UIView) {
        let l = UIView(frame: CGRect(x: 0, y: line, width: Int(container.frame.width) , height: 1))
        l.backgroundColor = UIColor.gray
        container.addSubview(l)
    }
    
    func setupCloseButton(){
        let closeButton = UIButton(frame: CGRect(x: 180, y: 4, width: 20, height: 20))
        closeButton.setTitleColor(UIColor.darkGray, for: UIControlState())
        closeButton.setTitle("x", for: UIControlState())
        closeButton.addTarget(self, action: #selector(close), for: .touchDown)
        viewCenter?.addSubview(closeButton)
    }
    
    func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        if configure.modal {
            configureModal()
        }
    }    
}


