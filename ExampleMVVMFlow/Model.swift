//
//  Model.swift
//  ExampleMVVMFlow
//
//  Created by apple on 03/07/16.
//  Copyright © 2016 Rodrigo Reis. All rights reserved.
//

import Foundation

protocol Model {
    
}

protocol ListModel : Model {
  associatedtype Model = Any
  func all() -> [Model]
  func one(at index: Int) -> Model
}