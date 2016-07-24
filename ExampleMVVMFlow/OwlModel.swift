//
//  OwlModel.swift
//  ExampleMVVMFlow
//
//  Created by apple on 03/07/16.
//  Copyright © 2016 Rodrigo Reis. All rights reserved.
//

import UIKit

struct Owl : DetailModel {
    let name : String
    let description : String
    let avatar : UIImage?
    
    static func loadBase() -> [Owl] {
        return [
                Owl(name : "ambassador", description: "Ambassador is ...", avatar: UIImage(named: "512px-owly-ambassador")),
                Owl(name: "appdir", description: "App dir is ...", avatar: UIImage(named: "512px-owly-appDir")),
                Owl(name: "argentina", description: "Argentina is ...", avatar: UIImage(named: "512px-owly-Argentina")),
                Owl(name: "astronaut", description: "Astronaut is ...", avatar: UIImage(named: "512px-owly-astronaut")),
                Owl(name: "australiaFemale", description: "Australia Female is ...", avatar: UIImage(named: "512px-owly-Australia-Female")),
                Owl(name: "australiaMale", description: "Australia Male is ...", avatar: UIImage(named: "512px-owly-Australia-Male")),
                Owl(name: "aviatorFemale", description: "Aviator Female is ...", avatar: UIImage(named: "512px-owly-aviator-female")),
                Owl(name: "biker", description: "Biker is ...", avatar: UIImage(named: "512px-owly-bike")),
                Owl(name: "binocularsNew", description: "Binoculars New is ...", avatar: UIImage(named: "512px-owly-binoculars-new")),
                Owl(name: "binoculars", description: "Binoculars is ...", avatar: UIImage(named: "512px-owly-binoculars")),
                Owl(name: "Black Suit", description: "Black Suit is ...", avatar: UIImage(named: "512px-owly-black-suit")),
                Owl(name: "Body Guard", description: "Body Guard is ...", avatar: UIImage(named: "512px-owly-bodyguard")),
                Owl(name: "Campus Ambassador", description: "Campus Ambassador is ...", avatar: UIImage(named: "512px-owly-campus-ambassador")),
                Owl(name: "Foodie Girl", description: "Foodie Girl is ...", avatar: UIImage(named: "512px-owly-foodie-girl")),
                Owl(name: "French", description: "French is ...", avatar: UIImage(named: "512px-owly-french")),
                Owl(name: "Graduate", description: "Graduate is ...", avatar: UIImage(named: "512px-owly-grad-HSU")),
                Owl(name: "Lumberjack", description: "Lumberjack is ...", avatar: UIImage(named: "512px-owly-lumberjack")),
                Owl(name: "Graduate", description: "Graduate is ...", avatar: UIImage(named: "512px-owly-grad-HSU")),
                Owl(name: "Mother", description: "Mother is ...", avatar: UIImage(named: "512px-owly-mother")),
                Owl(name: "Photo", description: "Photo is ...", avatar: UIImage(named: "512px-owly-photo")),
                Owl(name: "Sherlock UK", description: "Sherlock UK is ...", avatar: UIImage(named: "512px-owly-UK")),
                ]
    }
    
    func title() -> String {
        return name
    }
    func image() -> UIImage? {
        return avatar
    }
    func text() -> String {
        return description
    }
}

class OwlModel : ListModel {
    typealias Model = Owl
    
    let base = Owl.loadBase()
    
    func all() -> [Owl] {
        return base
    }
    
    func one(at index: Int)  -> Owl? {
        if index >= 0 && index < base.count {
            return base[index]
        }
        return nil
    }
}


