//
//  ViewController.swift
//  ExampleMVVMFlow
//
//  Created by apple on 02/07/16.
//  Copyright © 2016 Rodrigo Reis. All rights reserved.
//

import UIKit

struct ConfigureTable {
    let styleTable : UITableViewStyle
    let title : String
    let delegate : ListTableViewControllerDelegate
}

protocol ListTableViewControllerDelegate {
    func openDetail(id : Int)
}

class ListTableViewController<M : ListModel>: UITableViewController {
    
    var viewModel : ListViewModel<M>
    var populateCell : (M.Model,UITableViewCell) -> (Void)
    var configure : ConfigureTable
    
    init(viewModel model : ListViewModel<M>, configure : ConfigureTable, populateCell : (M.Model,UITableViewCell) -> (Void)) {
        self.viewModel = model
        self.populateCell = populateCell
        self.configure = configure
        super.init(style: configure.styleTable)
        self.title = configure.title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        populateCell(viewModel.item(ofIndex: indexPath.row), cell)
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        configure.delegate.openDetail(indexPath.row)
    }

}

