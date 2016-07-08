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
    let delegate : GridViewControllerDelegate
}

class GridViewController<M: ListModel> : UICollectionViewController {
    
    var viewModel : ListViewModel<M>?
    var populate : (M.Model,GridViewCell) -> (Void)
    var configure : ConfigureGrid
    
    
    init(configure : ConfigureGrid, populate : (M.Model,GridViewCell) -> (Void)) {
        self.populate = populate
        self.configure = configure
        super.init(collectionViewLayout: configure.viewLayout)
        self.collectionView?.frame = self.view.frame
        self.collectionView?.scrollEnabled = true
        self.collectionView?.pagingEnabled = true
        self.title = configure.title
        self.collectionView?.registerClass(GridViewCell.self, forCellWithReuseIdentifier: "Cell")
        self.collectionView?.backgroundColor = UIColor.whiteColor()
    }
    
    func configure(viewModel model : ListViewModel<M>) {
        self.viewModel = model
        self.collectionView?.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.count() ?? 0
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as? GridViewCell
        populate((viewModel?.item(ofIndex: indexPath.row))!, cell!)
        return cell!
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSize(width: 120, height: 120)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.configure.delegate.openDetail(indexPath.row)
    }
    
}

protocol GridViewControllerDelegate {
    func openDetail(id : Int)
}

class GridViewCell : UICollectionViewCell {
    var image : UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        subviews.filter { $0 as? UIImageView != nil}.forEach {$0.removeFromSuperview()}
        image = UIImageView(frame : CGRect(x: 0, y: 0, width: 120, height: 120))
        if let image = self.image {
            self.addSubview(image)
        }
    }
}

