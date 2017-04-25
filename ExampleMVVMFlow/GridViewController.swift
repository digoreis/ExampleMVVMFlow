//
//  GridViewController.swift
//  ExampleMVVMFlow
//
//  Created by apple on 03/07/16.
//  Copyright © 2016 Rodrigo Reis. All rights reserved.
//

import UIKit

struct ConfigureGrid {
    let viewLayout: UICollectionViewLayout
    let title: String
    let delegate: GridViewControllerDelegate
}

class GridViewController<M: ListModel> : UICollectionViewController {
    
    var viewModel: ListViewModel<M>?
    var populate: (M.Model, GridViewCell) -> (Void)
    var configure: ConfigureGrid
    
    
    init(configure: ConfigureGrid, populate: @escaping (M.Model,GridViewCell) -> (Void)) {
        self.populate = populate
        self.configure = configure
        super.init(collectionViewLayout: configure.viewLayout)
        self.collectionView?.frame = self.view.frame
        self.collectionView?.isScrollEnabled = true
        self.collectionView?.isPagingEnabled = true
        self.title = configure.title
        self.collectionView?.register(GridViewCell.self, forCellWithReuseIdentifier: "Cell")
        self.collectionView?.backgroundColor = UIColor.white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.count() ?? 0
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? GridViewCell
        populate((viewModel?.item(ofIndex: (indexPath as NSIndexPath).row))!, cell!)
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.configure.delegate.openDetailFor(id: (indexPath as NSIndexPath).row)
    }
    
}

protocol GridViewControllerDelegate {
    func openDetailFor(id : Int)
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
    
    fileprivate func setupUI() {
        subviews.filter { $0 as? UIImageView != nil}.forEach {$0.removeFromSuperview()}
        image = UIImageView(frame : CGRect(x: 0, y: 0, width: 120, height: 120))
        if let image = self.image {
            self.addSubview(image)
        }
    }
}

