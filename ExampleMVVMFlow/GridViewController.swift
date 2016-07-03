//
//  GridViewController.swift
//  ExampleMVVMFlow
//
//  Created by apple on 03/07/16.
//  Copyright © 2016 Rodrigo Reis. All rights reserved.
//

import UIKit

struct ConfigureGrid {
    let viewLayout : UICollectionViewLayout
    let title : String
}

class GridViewCell : UICollectionViewCell {
    var image : UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        image = UIImageView(frame : self.frame)
        self.addSubview(image!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        image = UIImageView(frame : self.frame)
        self.addSubview(image!)
    }
}

class GridViewController<M : ListModel>: UICollectionViewController {
    
    var viewModel : ListViewModel<M>
    var populateCell : (M.Model,GridViewCell) -> (Void)
    
    
    init(viewModel model : ListViewModel<M>, configure : ConfigureGrid, populateCell : (M.Model,GridViewCell) -> (Void)) {
        self.viewModel = model
        self.populateCell = populateCell
        super.init(collectionViewLayout: configure.viewLayout)
        self.collectionView?.frame = self.view.frame
        self.collectionView?.scrollEnabled = true
        self.collectionView?.pagingEnabled = true
        self.title = configure.title
        self.collectionView?.registerClass(GridViewCell.self, forCellWithReuseIdentifier: "Cell")
        self.collectionView?.backgroundColor = UIColor.whiteColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.count()
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as? GridViewCell
        populateCell(viewModel.item(ofIndex: indexPath.row), cell!)
        return cell!
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSize(width: 50, height: 50)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}

