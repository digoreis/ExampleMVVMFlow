//
//  ListViewModel.swift
//  ExampleMVVMFlow
//
//  Created by apple on 03/07/16.
//  Copyright © 2016 Rodrigo Reis. All rights reserved.
//

import Foundation


open class ListViewModel<T : ListModel> {
    let model : T
    
    init(model : T) {
        self.model = model
    }
    
    func count() -> Int {
        return model.all().count
    }
    
    func item(ofIndex index: Int) -> T.Model? {
        return model.one(at : index)
    }
}
