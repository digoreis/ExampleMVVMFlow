//
//  ViewController.swift
//  ExampleMVVMFlow
//
//  Created by apple on 02/07/16.
//  Copyright © 2016 Rodrigo Reis. All rights reserved.
//

import UIKit

struct ConfigureTable {
    let styleTable: UITableViewStyle
    let title: String
    let delegate: ListTableViewControllerDelegate
}

protocol ListTableViewControllerDelegate {
    func openDetailFor(id : Int)
}

class ListTableViewController<M : ListModel>: UITableViewController {
    
    var viewModel : ListViewModel<M>
    var populateCell : (M.Model, UITableViewCell) -> (Void)
    var configure : ConfigureTable
    
    init(viewModel model: ListViewModel<M>, configure: ConfigureTable, populateCell: @escaping (M.Model,UITableViewCell) -> (Void)) {
        self.viewModel = model
        self.populateCell = populateCell
        self.configure = configure
        super.init(style: configure.styleTable)
        self.title = configure.title
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        if let item = viewModel.item(ofIndex: (indexPath as NSIndexPath).row) {
            populateCell(item, cell)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        configure.delegate.openDetailFor(id: (indexPath as NSIndexPath).row)
    }

}

